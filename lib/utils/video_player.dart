import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isLoading = true;
  String? errorMessage;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  Future<void> initializeVideo({int retryCount = 0, int maxRetries = 2}) async {
    log('Initializing video from ${widget.videoUrl}, attempt ${retryCount + 1}');

    String url = widget.videoUrl;
    if (url.contains('drive.google.com') && retryCount > 0) {
      var fileId = url.split('id=')[1].split('&')[0];
      url =
          'https://drive.usercontent.google.com/download?id=$fileId&export=download';
      log('Retrying with alternative URL: $url');
    }

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );

    try {
      await _controller.initialize();
      setState(() {
        isLoading = false;
        errorMessage = null;
        _duration = _controller.value.duration;
      });
      _controller.setLooping(true);
      _controller.addListener(() {
        if (mounted) {
          setState(() {
            _position = _controller.value.position;
          });
        }
      });
      log('Video initialized successfully');
    } catch (e) {
      log('Error initializing video: $e');
      if (retryCount < maxRetries) {
        log('Retrying initialization (attempt ${retryCount + 2})');
        await Future.delayed(const Duration(seconds: 2));
        return initializeVideo(
            retryCount: retryCount + 1, maxRetries: maxRetries);
      }
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load video: ${e.toString()}';
      });
    }
  }

  // Format Duration to mm:ss
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Seek forward or backward by 15 seconds
  void _seekBy(Duration delta) {
    final newPosition = _position + delta;
    if (newPosition < Duration.zero) {
      _controller.seekTo(Duration.zero);
      log('Seek backward to start of video');
    } else if (newPosition > _duration) {
      _controller.seekTo(_duration);
      log('Seek forward to end of video');
    } else {
      _controller.seekTo(newPosition);
      log('Seeking to ${newPosition.inSeconds} seconds');
    }
  }

  @override
  void dispose() {
    log('Disposing video controller');
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : _controller.value.isInitialized
            ? Column(
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  const SizedBox(height: 10),
                  // Seek bar
                  Slider(
                    value: _position.inSeconds.toDouble(),
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      final newPosition = Duration(seconds: value.toInt());
                      _controller.seekTo(newPosition);
                      log('Seeking to ${newPosition.inSeconds} seconds via slider');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(_position)),
                        Text(_formatDuration(_duration)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Control buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10),
                        onPressed: () {
                          _seekBy(const Duration(seconds: -15));
                          setState(() {
                            _position = _controller.value.position;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                              log('Video paused');
                            } else {
                              _controller.play();
                              log('Video playing');
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10),
                        onPressed: () {
                          _seekBy(const Duration(seconds: 15));
                          setState(() {
                            _position = _controller.value.position;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(errorMessage ?? 'Failed to load video'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                          errorMessage = null;
                        });
                        initializeVideo();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  bool _isBuffering = false;
  bool _controlsVisible = true; // Track visibility of controls
  Timer? _controlsTimer; // Timer for hiding controls

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    // Lock orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  Future<void> _initializeVideo() async {
    setState(() {
      _isBuffering = true; // Show buffer indicator
    });

    _controller = VideoPlayerController.network(widget.videoUrl);
    _controller.addListener(() {
      setState(() {
        _isBuffering =
            _controller.value.isBuffering; // Simplified buffering logic
        // Check for video playback errors
        if (_controller.value.hasError) {
          _handleVideoError();
        }
      });
    });

    try {
      await _controller.initialize();
      setState(() {
        _isBuffering = false;
      });
      _controller.setLooping(true);
      _controller.play(); // Auto-play video once initialized
    } catch (error) {
      print("Error initializing video: $error");
    }
  }

  void _handleVideoError() {
    // Log the error and attempt to reconnect
    print("Video playback error: ${_controller.value.errorDescription}");
    _reconnectVideo();
  }

  Future<void> _reconnectVideo() async {
    // Retry initializing the video after a brief delay
    await Future.delayed(Duration(seconds: 2));
    await _initializeVideo();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controlsTimer?.cancel(); // Cancel the timer if it's active
    // Restore orientation to default when leaving the screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  void _togglePlayback() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showControls(); // Show controls when paused
      } else {
        _controller.play();
        _hideControls(); // Hide controls when playing
      }
    });
  }

  void _seekForward() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    if (newPosition < _controller.value.duration) {
      _controller.seekTo(newPosition);
    }
  }

  void _seekBackward() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      _controller.seekTo(newPosition);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void _hideControls() {
    _controlsTimer?.cancel(); // Cancel any existing timer
    _controlsTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _controlsVisible = false; // Hide controls after 3 seconds
      });
    });
  }

  void _showControls() {
    _controlsTimer?.cancel(); // Cancel any existing timer
    setState(() {
      _controlsVisible = true; // Show controls immediately
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildFullScreenVideo(),
    );
  }

  Widget _buildFullScreenVideo() {
    return Stack(
      children: <Widget>[
        Center(
          child: _controller.value.isInitialized
              ? GestureDetector(
                  onTap: _togglePlayback,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size?.width ?? 0,
                        height: _controller.value.size?.height ?? 0,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorsConstant.redColor,
                  ),
                ),
        ),
        if (_isBuffering)
          Center(
            child: CircularProgressIndicator(
              color: ColorsConstant.redColor,
            ), // Buffering indicator
          ),
        if (_controlsVisible) // Only show controls if they are visible
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildControls(),
          ),
      ],
    );
  }

  Widget _buildControls() {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress bar
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: ColorsConstant.redColor,
              bufferedColor: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.replay_10,
                    size: 50.0, color: Colors.white),
                onPressed: _seekBackward,
              ),
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 60.0,
                  color: Colors.white,
                ),
                onPressed: _togglePlayback,
              ),
              IconButton(
                icon: const Icon(Icons.forward_10,
                    size: 50.0, color: Colors.white),
                onPressed: _seekForward,
              ),
              IconButton(
                icon: Icon(
                  _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  size: 40.0,
                  color: Colors.white,
                ),
                onPressed: _toggleFullscreen,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

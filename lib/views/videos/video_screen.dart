import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pehli_gaza_app/api_services/video_api.dart';
import 'package:pehli_gaza_app/model/video_model.dart';
import 'package:pehli_gaza_app/views/videos/video_player_screen.dart';
import '../bottomNavBar/bottomnavbar.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with AutomaticKeepAliveClientMixin<VideoScreen>, WidgetsBindingObserver {
  late VideoAPI videoAPI;
  bool isFullScreen = false;
  bool isInternetAvailable = false;

  @override
  void initState() {
    super.initState();
    videoAPI = VideoAPI();
    WidgetsBinding.instance.addObserver(this);
    _checkInternetConnection(); // Check internet connection at startup
  }

  // Check internet connection
  Future<void> _checkInternetConnection() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    setState(() {
      isInternetAvailable = connectivityResult != ConnectivityResult.none;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    videoAPI = VideoAPI();
    _fetchVideos(); // Fetch videos after updating the token
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<List<VideoModel>> _fetchVideos() async {
    // Check the connection again before fetching the data
    await _checkInternetConnection();

    if (!isInternetAvailable) {
      // If no internet, use default fallback thumbnails
      return []; // Return empty list or handle this case properly
    }

    try {
      return await videoAPI
          .fetchVideos(); // Use the video API when internet is available
    } catch (e) {
      // Handle network error gracefully
      print('Error fetching videos: $e');
      return []; // Return empty list if there is an error fetching the videos
    }
  }

  // Future<VideoPlayerController> _initializeVideo(String videoUrl) async {
  //   VideoPlayerController controller = VideoPlayerController.network(videoUrl);
  //   await controller.initialize();
  //   controller.setLooping(true);
  //   controller.setVolume(0);
  //   return controller;
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(212, 223, 234, 0.37),
    ));
    super.build(context);

    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: isFullScreen || isLandscape
              ? EdgeInsets.zero
              : const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(212, 223, 234, 0.37), Color(0xFFBDC8D3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isFullScreen && !isLandscape)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'آگاہی ویڈیوز',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoNastaliqUrdu',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<VideoModel>>(
                  future: _fetchVideos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting, display thumbnails and different texts based on index
                      return ListView.builder(
                        itemCount: 2, // Show 2 thumbnails as placeholders
                        itemBuilder: (context, index) {
                          String thumbnail = _getDefaultThumbnail(
                              index); // Get default thumbnail based on index
                          String loadingText = _getLoadingText(
                              index); // Get loading text based on index

                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6.0,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      VideoModel video = snapshot.data![index];
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VideoPlayerScreen(
                                                  videoUrl: video.link),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 260,
                                      child: Image.asset(
                                        thumbnail, // Show the default thumbnail
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, top: 10, right: 10),
                                    child: Text(
                                      loadingText, // Display loading text
                                      style: const TextStyle(
                                        fontFamily: 'NotoNastaliqUrdu',
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error fetching videos'));
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          VideoModel video = snapshot.data![index];
                          // Default thumbnail selection based on the video index or ID
                          String thumbnailUrl = isInternetAvailable
                              ? video.thumbnail
                              : _getDefaultThumbnail(
                                  index); // Get default thumbnail based on index

                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6.0,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 260,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (video.link.isEmpty ||
                                            !Uri.tryParse(video.link)!
                                                .isAbsolute) {
                                          print(
                                              "Invalid video URL: ${video.link}");
                                          return;
                                        }
                                        print(
                                            "Navigating to VideoPlayerScreen with: ${video.link}");

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlayerScreen(
                                                    videoUrl: video.link),
                                          ),
                                        );
                                      },
                                      child: Image.network(
                                        thumbnailUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, top: 10, right: 10),
                                    child: Text(
                                      video.title,
                                      style: const TextStyle(
                                        fontFamily: 'NotoNastaliqUrdu',
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDefaultThumbnail(int index) {
    // Return different default thumbnails for each video (based on index or other criteria)
    switch (index) {
      case 0:
        return 'assets/images/V-01.png'; // First default thumbnail
      case 1:
        return 'assets/images/V-02.png'; // Second default thumbnail
      default:
        return 'assets/images/V-01.png'; // Fallback default thumbnail
    }
  }

  String _getLoadingText(int index) {
    switch (index) {
      case 0:
        return 'زندگی کے پہلے 1000 دن';
      case 1:
        return 'ماں کا دودھ بچے کے لیے صحت مند اور محفوظ';
      default:
        return 'ویڈیو لوڈ ہو رہی ہے...';
    }
  }

  @override
  bool get wantKeepAlive => true;
}

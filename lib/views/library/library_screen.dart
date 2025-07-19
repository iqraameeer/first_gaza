import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../config/route_imports.dart';
import '../../utils/alert_message.dart';
import '../../widget/radial_background.dart';
import 'library_controller.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  final LibraryController controller = Get.put(LibraryController());
  List<Map<String, dynamic>> _filteredContentList = [];
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  final List<Map<String, String>> additionalVideos = [
    {
      "title": "بچے کی کینگرو دیکھ بھال کیا ہے؟",
      "roman": "What is kangaroo mother care?",
      "url":
          "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freel%2F2502025016803351"
    },
    {
      "title": "دودھ پلانے پر ذہنی دباؤ کے اثرات",
      "roman": "Effects of stress on breastfeeding",
      "url":
          "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freel%2F1288059372238494"
    },
    {
      "title": " کیا لڑکوں اور لڑکیوں کی غذائی ضروریات ایک جیسی ہوتی ہیں؟",
      "roman": "Are the nutritional requirements of boys and girls the same?",
      "url":
          "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freel%2F1911809566221393"
    },
    {
      "title": "بچوں کے لیے صحت مند غذائی انتخاب",
      "roman": "Healthy options for children",
      "url":
          "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freel%2F1911809566221393"
    },
    {
      "title": "چینی شیر خوار بچوں کے لیے نقصان دہ ہے",
      "roman": "Sugar is harmful for infant",
      "url":
          "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freel%2F1123274955941357"
    },
    {
      "title": "کم لاگت میں غذائیت سے بھرپور خوراک کیسے حاصل کریں؟",
      "roman": "How to get nutritional food at low cost?",
      "url":
          "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freel%2F95479484391210"
    },
    {
      "title": "پروسس شدہ خوراک بچوں کے لیے مناسب نہیں",
      "roman": "Processed food is not good for children",
      "url":
          "https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freel%2F1301322321089882"
    },
    {
      "title": "بیماری کے دوران غذا کا کردار",
      "roman": "Role of diet during infection",
      "url": "https://www.facebook.com/reel/3234114473397137"
    },
  ];

  @override
  void initState() {
    super.initState();
    _filteredContentList = controller.contentList;
    _searchController.addListener(_filterData);
    controller.triggerAnimation();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _filterData() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContentList = controller.contentList.where((item) {
        return item['title']!.toLowerCase().contains(query) ||
            item['roman']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const RadialBackground(),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  const Center(
                    child: Text(
                      'لائبریری',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoNastaliqUrdu',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    controller: _tabController,
                    labelColor: ColorsConstant.btnlogin,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: ColorsConstant.btnlogin,
                    tabs: const [
                      Tab(text: 'Messages'),
                      Tab(text: 'Additional Videos'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintStyle:
                                    TextStyle(fontFamily: 'PlusJakartaSans'),
                                hintText: 'Search...',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        GetBuilder<LibraryController>(
                          init: controller,
                          builder: (_) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: _filteredContentList.length,
                              itemBuilder: (context, index) {
                                String title =
                                    _filteredContentList[index]["title"];
                                String week =
                                    _filteredContentList[index]["week"];
                                int day = _filteredContentList[index]["day"];

                                return AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: 300 + (index * 200)),
                                  curve: Curves.easeInOut,
                                  transform: Matrix4.translationValues(
                                    controller.startAnimation.value
                                        ? 0
                                        : MediaQuery.of(context).size.width,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        title,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                          fontFamily: 'JameelNoori',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                      ),
                                      leading: Icon(
                                        Icons.arrow_back_ios,
                                        color: ColorsConstant.btnlogin,
                                      ),
                                      onTap: () {
                                        switch (week) {
                                          case "PregWeek35":
                                            Get.toNamed(
                                                AppRoutes.pregWeek35Detail,
                                                arguments: {
                                                  'selectedDay': day
                                                });
                                            break;
                                          case "PregWeek36":
                                            Get.toNamed(
                                                AppRoutes.pregWeek36Detail,
                                                arguments: {
                                                  'selectedDay': day
                                                });
                                            break;
                                          case "PregWeek37":
                                            Get.toNamed(
                                                AppRoutes.pregWeek37Detail,
                                                arguments: {
                                                  'selectedDay': day
                                                });
                                            break;
                                          case "ChildWeek01":
                                            Get.toNamed(
                                              AppRoutes.childWeek01Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek02":
                                            Get.toNamed(
                                              AppRoutes.childWeek02Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek03":
                                            Get.toNamed(
                                              AppRoutes.childWeek03Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek04":
                                            Get.toNamed(
                                              AppRoutes.childWeek04Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek05":
                                            Get.toNamed(
                                              AppRoutes.childWeek05Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek06":
                                            Get.toNamed(
                                              AppRoutes.childWeek06Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek07":
                                            Get.toNamed(
                                              AppRoutes.childWeek07Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek08":
                                            Get.toNamed(
                                              AppRoutes.childWeek08Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek09":
                                            Get.toNamed(
                                              AppRoutes.childWeek09Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek10":
                                            Get.toNamed(
                                              AppRoutes.childWeek10Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek11":
                                            Get.toNamed(
                                              AppRoutes.childWeek11Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek12":
                                            Get.toNamed(
                                              AppRoutes.childWeek12Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek13":
                                            Get.toNamed(
                                              AppRoutes.childWeek13Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek14":
                                            Get.toNamed(
                                              AppRoutes.childWeek14Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek15":
                                            Get.toNamed(
                                              AppRoutes.childWeek15Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek16":
                                            Get.toNamed(
                                              AppRoutes.childWeek16Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek 17":
                                            Get.toNamed(
                                              AppRoutes.childWeek17Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek18":
                                            Get.toNamed(
                                              AppRoutes.childWeek18Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek19":
                                            Get.toNamed(
                                              AppRoutes.childWeek19Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek20":
                                            Get.toNamed(
                                              AppRoutes.childWeek20Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek21":
                                            Get.toNamed(
                                              AppRoutes.childWeek21Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek22":
                                            Get.toNamed(
                                              AppRoutes.childWeek22Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek23":
                                            Get.toNamed(
                                              AppRoutes.childWeek23Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek24":
                                            Get.toNamed(
                                              AppRoutes.childWeek24Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek25":
                                            Get.toNamed(
                                              AppRoutes.childWeek25Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek26":
                                            Get.toNamed(
                                              AppRoutes.childWeek26Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek27":
                                            Get.toNamed(
                                              AppRoutes.childWeek27Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek28":
                                            Get.toNamed(
                                              AppRoutes.childWeek28Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek29":
                                            Get.toNamed(
                                              AppRoutes.childWeek29Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek30":
                                            Get.toNamed(
                                              AppRoutes.childWeek30Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek31":
                                            Get.toNamed(
                                              AppRoutes.childWeek31Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek32":
                                            Get.toNamed(
                                              AppRoutes.childWeek32Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek33":
                                            Get.toNamed(
                                              AppRoutes.childWeek33Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek34":
                                            Get.toNamed(
                                              AppRoutes.childWeek34Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek35":
                                            Get.toNamed(
                                              AppRoutes.childWeek35Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek36":
                                            Get.toNamed(
                                              AppRoutes.childWeek36Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek37":
                                            Get.toNamed(
                                              AppRoutes.childWeek37Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek38":
                                            Get.toNamed(
                                              AppRoutes.childWeek38Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek39":
                                            Get.toNamed(
                                              AppRoutes.childWeek39Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek40":
                                            Get.toNamed(
                                              AppRoutes.childWeek40Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek41":
                                            Get.toNamed(
                                              AppRoutes.childWeek41Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek42":
                                            Get.toNamed(
                                              AppRoutes.childWeek42Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek43":
                                            Get.toNamed(
                                              AppRoutes.childWeek43Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek44":
                                            Get.toNamed(
                                              AppRoutes.childWeek44Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek45":
                                            Get.toNamed(
                                              AppRoutes.childWeek45Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek46":
                                            Get.toNamed(
                                              AppRoutes.childWeek46Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek47":
                                            Get.toNamed(
                                              AppRoutes.childWeek47Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          case "ChildWeek48":
                                            Get.toNamed(
                                              AppRoutes.childWeek48Detail,
                                              arguments: {'selectedDay': day},
                                            );
                                            break;
                                          default:
                                            AlertMessage.showSnackBar(
                                              context,
                                              'Content not available for selected week',
                                              const Duration(seconds: 2),
                                              Colors.black,
                                            );
                                            break;
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                // indent: 0.1 * MediaQuery.of(context).size.width,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            );
                          },
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: additionalVideos.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  additionalVideos[index]['title']!,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    fontFamily: 'JameelNoori',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                leading: Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorsConstant.btnlogin,
                                ),
                                onTap: () {
                                  Get.to(() => VideoPlayerScreen(
                                        videoUrl: additionalVideos[index]
                                            ['url']!,
                                        title: additionalVideos[index]
                                            ['title']!,
                                      ));
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            // indent: 0.1 * MediaQuery.of(context).size.width,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoPlayerScreen(
      {super.key, required this.videoUrl, required this.title});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            AlertMessage.showSnackBar(
              context,
              'Failed to load video: ${error.description}',
              const Duration(seconds: 2),
              Colors.red,
            );
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.facebook.com')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.videoUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          widget.title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontFamily: 'JameelNoori',
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorsConstant.btnlogin,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _webViewController),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

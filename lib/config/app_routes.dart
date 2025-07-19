part of 'route_imports.dart';

class AppRoutes {
  static String splash = "/splash";
  static String welcome = "/welcome";
  static String signin = "/signin";
  static String forgetPassword = "/forgetPassword";
  static String bottomNavBar = '/bottomNavBar';
  static String home = '/home';
  static String pregWeek35Detail = '/pregWeek35Detail';
  static String pregWeek36Detail = '/pregWeek36Detail';
  static String pregWeek37Detail = '/pregWeek37Detail';
  static String childWeek01Detail = '/childWeek01Detail';
  static String childWeek02Detail = '/childWeek02Detail';
  static String childWeek03Detail = '/childWeek03Detail';
  static String childWeek04Detail = '/childWeek04Detail';
  static String childWeek05Detail = '/childWeek05Detail';
  static String childWeek06Detail = '/childWeek06Detail';
  static String childWeek07Detail = '/childWeek07Detail';
  static String childWeek08Detail = '/childWeek08Detail';
  static String childWeek09Detail = '/childWeek09Detail';
  static String childWeek10Detail = '/childWeek10Detail';
  static String childWeek11Detail = '/childWeek11Detail';
  static String childWeek12Detail = '/childWeek12Detail';
  static String childWeek13Detail = '/childWeek13Detail';
  static String childWeek14Detail = '/childWeek14Detail';
  static String childWeek15Detail = '/childWeek15Detail';
  static String childWeek16Detail = '/childWeek16Detail';
  static String childWeek17Detail = '/childWeek17Detail';
  static String childWeek18Detail = '/childWeek18Detail';
  static String childWeek19Detail = '/childWeek19Detail';
  static String childWeek20Detail = '/childWeek20Detail';
  static String childWeek21Detail = '/childWeek21Detail';
  static String childWeek22Detail = '/childWeek22Detail';
  static String childWeek23Detail = '/childWeek23Detail';
  static String childWeek24Detail = '/childWeek24Detail';
  static String childWeek25Detail = '/childWeek25Detail';
  static String childWeek26Detail = '/childWeek26Detail';
  static String childWeek27Detail = '/childWeek27Detail';
  static String childWeek28Detail = '/childWeek28Detail';
  static String childWeek29Detail = '/childWeek29Detail';
  static String childWeek30Detail = '/childWeek30Detail';
  static String childWeek31Detail = '/childWeek31Detail';
  static String childWeek32Detail = '/childWeek32Detail';
  static String childWeek33Detail = '/childWeek33Detail';
  static String childWeek34Detail = '/childWeek34Detail';
  static String childWeek35Detail = '/childWeek35Detail';
  static String childWeek36Detail = '/childWeek36Detail';
  static String childWeek37Detail = '/childWeek37Detail';
  static String childWeek38Detail = '/childWeek38Detail';
  static String childWeek39Detail = '/childWeek39Detail';
  static String childWeek40Detail = '/childWeek40Detail';
  static String childWeek41Detail = '/childWeek41Detail';
  static String childWeek42Detail = '/childWeek42Detail';
  static String childWeek43Detail = '/childWeek43Detail';
  static String childWeek44Detail = '/childWeek44Detail';
  static String childWeek45Detail = '/childWeek45Detail';
  static String childWeek46Detail = '/childWeek46Detail';
  static String childWeek47Detail = '/childWeek47Detail';
  static String childWeek48Detail = '/childWeek48Detail';

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: welcome,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: signin,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: forgetPassword,
      page: () => ForgetPasswordScreen(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: bottomNavBar,
      page: () => BottomNavBar(),
    ),
    GetPage(
      name: pregWeek35Detail,
      page: () => PregWeek35DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 800),
    ),
    GetPage(
      name: pregWeek36Detail,
      page: () => PregWeek36DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 800),
    ),
    GetPage(
      name: pregWeek37Detail,
      page: () => PregWeek37DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek01Detail,
      page: () => ChildWeek01DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek02Detail,
      page: () => ChildWeek02DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek03Detail,
      page: () => ChildWeek03DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek04Detail,
      page: () => ChildWeek04DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek05Detail,
      page: () => ChildWeek05DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek06Detail,
      page: () => ChildWeek06DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek07Detail,
      page: () => ChildWeek07DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek08Detail,
      page: () => ChildWeek08DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek09Detail,
      page: () => ChildWeek09DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek10Detail,
      page: () => ChildWeek10DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek11Detail,
      page: () => ChildWeek11DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek12Detail,
      page: () => ChildWeek12DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek13Detail,
      page: () => ChildWeek13DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek14Detail,
      page: () => ChildWeek14DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek15Detail,
      page: () => ChildWeek15DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek16Detail,
      page: () => ChildWeek16DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek17Detail,
      page: () => ChildWeek17DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek18Detail,
      page: () => ChildWeek18DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek19Detail,
      page: () => ChildWeek19DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek20Detail,
      page: () => ChildWeek20DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek21Detail,
      page: () => ChildWeek21DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek22Detail,
      page: () => ChildWeek22DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek23Detail,
      page: () => ChildWeek23DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek24Detail,
      page: () => ChildWeek24DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek25Detail,
      page: () => ChildWeek25DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek26Detail,
      page: () => ChildWeek26DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek27Detail,
      page: () => ChildWeek27DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek28Detail,
      page: () => ChildWeek28DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek29Detail,
      page: () => ChildWeek29DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek30Detail,
      page: () => ChildWeek30DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek31Detail,
      page: () => ChildWeek31DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek32Detail,
      page: () => ChildWeek32DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek33Detail,
      page: () => ChildWeek33DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek34Detail,
      page: () => ChildWeek34DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek35Detail,
      page: () => ChildWeek35DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek36Detail,
      page: () => ChildWeek36DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek37Detail,
      page: () => ChildWeek37DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek38Detail,
      page: () => ChildWeek38DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek39Detail,
      page: () => ChildWeek39DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek40Detail,
      page: () => ChildWeek40DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek41Detail,
      page: () => ChildWeek41DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek42Detail,
      page: () => ChildWeek42DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek43Detail,
      page: () => ChildWeek43DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek44Detail,
      page: () => ChildWeek44DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek45Detail,
      page: () => ChildWeek45DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek46Detail,
      page: () => ChildWeek46DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek47Detail,
      page: () => ChildWeek47DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: childWeek48Detail,
      page: () => ChildWeek48DetailScreen(
        selectedDay: Get.arguments['selectedDay'],
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 600),
    ),
  ];
}

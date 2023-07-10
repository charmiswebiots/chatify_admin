import 'dart:developer';
import 'dart:ui';
import 'package:chatify_admin/routes/index.dart';
import 'common/language/index.dart';
import 'config.dart';
import 'dart:html' as html;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391
  GetStorage.init();
  Get.put(AppController());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        /*apiKey: "AIzaSyAoc27X-TFvbjKbL5XGgq9zyQj3ZEE2LNs",
        authDomain: "chatify-195b1.firebaseapp.com",
        projectId: "chatify-195b1",
        storageBucket: "chatify-195b1.appspot.com",
        messagingSenderId: "432304404919",
        appId: "1:432304404919:web:13d8d0c43bb63bc1045032",
        measurementId: "G-591LHY9MBM"*/
        apiKey: "AIzaSyARL103Jpa5MjBJImQfwwGFRLNrye0-c3k",
        authDomain: "chat-clone-d5c03.firebaseapp.com",
        projectId: "chat-clone-d5c03",
        storageBucket: "chat-clone-d5c03.appspot.com",
        messagingSenderId: "879384621248",
        appId: "1:879384621248:web:782ba61d05c6ba9d347d25",
        measurementId: "G-YZZXPWPL51"),
  );


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var scaffoldDrawerKey = GlobalKey<ScaffoldState>(debugLabel: "drawer");
  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "key2");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appCtrl.isLogin = html.window.localStorage[session.isLogin] ?? "false";
    log(appCtrl.isLogin);
    return GetMaterialApp(
      builder: (context, widget) {
        return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
               print("snap:${snapshot.hasData}");
              return !snapshot.hasData ? MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              ) : LoginScreen();
            }
        );
      },
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // tran
      title: fonts.chatifyAdmin.tr,
      home: appCtrl.isLogged == true ? IndexLayout(scaffoldDrawerKey: scaffoldDrawerKey,scaffoldKey: scaffoldKey) : LoginScreen(),
      getPages: appRoute.getPages,
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: ThemeService().theme,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

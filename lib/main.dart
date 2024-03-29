import 'dart:developer';
import 'dart:ui';
import 'package:chatify_admin/routes/index.dart';
import 'common/language/index.dart';
import 'config.dart';
import 'package:universal_html/html.dart' as html;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391
  GetStorage.init();
  Get.put(AppController());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAXx7b0-yny7--rcC7QOwQYVtyUods4-D0",
        authDomain: "chatify-eee03.firebaseapp.com",
        projectId: "chatify-eee03",
        storageBucket: "chatify-eee03.appspot.com",
        messagingSenderId: "746529411345",
        appId: "1:746529411345:web:a8a495d35c09e00e617cb0",
        measurementId: "G-6P9N1BDTFK"
       ),

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

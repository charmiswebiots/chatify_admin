
import '../../config.dart';
import '../../controllers/app_pages_controller/login_controller.dart';
import 'layouts/dark_language_layout.dart';
import 'layouts/login_layout.dart';


class LoginScreen extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Builder(
            builder: (context) {
              return Scaffold(
                  backgroundColor: appCtrl.appTheme.whiteColor,
                  body: GlassMorphicLayout(
                      linearGradient: backgroundLinearGradient(),
                      child: GlassMorphicLayout(
                          linearGradient: loginLinearGradient(),
                          child: Column(children:  const [
                            DarkLanguageLayout(),
                            VSpace(Sizes.s80),
                            LoginLayout()
                          ]))));
            }
          ),
        );
      }
    );
  }
}

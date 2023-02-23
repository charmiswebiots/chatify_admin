import '../config.dart';

extension ChatifyExtansion on Widget {
  // Box extension
  Widget boxExtension() => Container(child: this).decorated(
          color: appCtrl.isTheme
              ? appCtrl.appTheme.accentTxt
              : appCtrl.appTheme.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
          boxShadow: [
            BoxShadow(
                color: appCtrl.appTheme.greyLight25,
                spreadRadius: 5,
                blurRadius: 5)
          ]);
}

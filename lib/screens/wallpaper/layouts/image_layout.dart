import 'dart:developer';


import 'package:chatify_admin/controllers/app_pages_controller/wallpaper_controller.dart';

import '../../../config.dart';

class ImageLayout extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  final bool isWallPaper;
  const ImageLayout({Key? key, this.setState,this.image,this.isWallPaper = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WallpaperController>(builder: (bannerCtrl) {
      log("bannerCtrl.pickImage : ${bannerCtrl.imageUrl.isNotEmpty || bannerCtrl.pickImage != null  || bannerCtrl.webImage.isNotEmpty}");
      return   SizedBox(
          height: Sizes.s50,
          child: Stack(
              alignment: Alignment.centerLeft, children: [
            DragDropLayout(
                onCreated: (ctrl) =>
                bannerCtrl.controller1 = ctrl,
                onDrop: (ev) async {

                  bannerCtrl.imageName = ev.name;
                  bannerCtrl.update();
                  final bytes = await bannerCtrl
                      .controller1!.getFileData(ev);
                  bannerCtrl.getImage(
                      dropImage: bytes);
                }),
            bannerCtrl.imageUrl.isNotEmpty &&
                bannerCtrl.pickImage != null
                ? CommonDottedBorder(
                child: Image.memory(
                    bannerCtrl.webImage,
                    fit: BoxFit.fill))
                .inkWell(
                onTap: () =>
                    bannerCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context))
                : bannerCtrl.imageUrl.isNotEmpty
                ? CommonDottedBorder(
                child: Image.network(
                    bannerCtrl.imageUrl))
                .inkWell(
                onTap: () =>
                    bannerCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context))
                : bannerCtrl.pickImage == null
                ?  CommonDottedBorder(
                child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start,children: [
                  Image.asset(imageAssets.gallery, height:Sizes.s100),
                  const VSpace(Sizes.s10),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: fonts.clickToUpload.tr,
                            style: AppCss.poppinsMedium14
                                .textColor(appCtrl.appTheme.primary)
                                .textDecoration(TextDecoration.underline)),
                        TextSpan(
                            text: fonts.orDragDrop.tr,
                            style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.dark))
                      ])).marginSymmetric(horizontal: Insets.i10)
                ]).width(200)).inkWell(
                onTap: () =>
                    bannerCtrl.onImagePickUp(
                        setState, context,""))
                : CommonDottedBorder(
                child: Image.memory(
                    bannerCtrl.webImage,
                    fit: BoxFit.fill))
                .inkWell(
                onTap: () =>
                    bannerCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context))
          ])
      );
    });
  }
}

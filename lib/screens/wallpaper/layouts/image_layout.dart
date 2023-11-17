import 'dart:developer';

import 'package:chatify_admin/controllers/app_pages_controller/wallpaper_controller.dart';
import 'package:desktop_drop/desktop_drop.dart';

import '../../../config.dart';

class ImageLayout extends StatelessWidget {
  final StateSetter? setState;
  final String? image;

  const ImageLayout({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WallpaperController>(builder: (bannerCtrl) {
      log("bannerCtrl.pickImage : ${bannerCtrl.imageUrl.isNotEmpty || bannerCtrl.pickImage != null || bannerCtrl.webImage.isNotEmpty}");
      return Stack(alignment: Alignment.centerLeft, children: [
        DropTarget(
          onDragDone: (detail) async {
            bannerCtrl.imageName = detail.files.first.name;
            bannerCtrl.update();
            final bytes = await detail.files.first.readAsBytes();
            bannerCtrl.getImage(dropImage: bytes, title: "image1");

            log("detail.files :${detail.files}");
          },
          onDragEntered: (detail) {
            log("ENTER : ${detail}");
          },
          onDragExited: (detail) {
            log("ExIt : ${detail}");
          },
          child: image!.isNotEmpty &&
                  image != "" &&
                  bannerCtrl.pickImage != null &&
                  bannerCtrl.webImage.isNotEmpty
              ? CommonDottedBorder(
                  child: Image.memory(
                  bannerCtrl.webImage,
                  fit: BoxFit.fill,
                  height: Sizes.s150,
                  width: Sizes.s150,
                )).inkWell(
                  onTap: () => bannerCtrl.getImage(
                      source: ImageSource.gallery,
                      context: context,
                      title: "image1"))
              : image!.isNotEmpty
                  ? CommonDottedBorder(
                      child: Image.network(
                      image!,
                      height: Sizes.s150,
                      width: Sizes.s150,
                    )).inkWell(
                      onTap: () => bannerCtrl.getImage(
                          source: ImageSource.gallery,
                          context: context,
                          title: "image1"))
                  : bannerCtrl.pickImage == null
                      ? const ImagePickUp().inkWell(
                          onTap: () => bannerCtrl.onImagePickUp(
                              setState, context, "image1"))
                      : CommonDottedBorder(
                              child: Image.memory(bannerCtrl.webImage,
                                  fit: BoxFit.fill,
                                  height: Sizes.s150,
                                  width: Sizes.s150))
                          .inkWell(
                              onTap: () => bannerCtrl.getImage(
                                  source: ImageSource.gallery,
                                  context: context,
                                  title: "image1")),
        ),
      ])
          .height(bannerCtrl.isUploadSize
              ? Sizes.s150
              : image!.isNotEmpty
                  ? Sizes.s150
                  : Sizes.s50)
          .width(Sizes.s200);
    });
  }
}

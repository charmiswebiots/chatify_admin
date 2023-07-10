import 'dart:developer';


import 'package:chatify_admin/controllers/app_pages_controller/wallpaper_controller.dart';

import '../../../config.dart';

class ImageLayout extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  const ImageLayout({Key? key, this.setState,this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WallpaperController>(builder: (bannerCtrl) {
      log("bannerCtrl.pickImage : ${bannerCtrl.imageUrl.isNotEmpty || bannerCtrl.pickImage != null  || bannerCtrl.webImage.isNotEmpty}");
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => bannerCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              bannerCtrl.imageName = ev.name;
              bannerCtrl.update();
              final bytes = await bannerCtrl.controller1!.getFileData(ev);
              bannerCtrl.getImage(dropImage: bytes, title: "image1");
            }),
        image!.isNotEmpty &&
            image != "" &&
            bannerCtrl.pickImage != null &&
            bannerCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(
            child: Image.memory(bannerCtrl.webImage, fit: BoxFit.fill,height: Sizes.s150,width: Sizes.s150,))
            .inkWell(
            onTap: () => bannerCtrl.getImage(
                source: ImageSource.gallery,
                context: context,
                title: "image1"))
            : image!.isNotEmpty
            ? CommonDottedBorder(
            child: Image.network(
              image!,
              height: Sizes.s150,width: Sizes.s150,
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
                fit: BoxFit.fill,height: Sizes.s150,width: Sizes.s150))
            .inkWell(
            onTap: () => bannerCtrl.getImage(
                source: ImageSource.gallery,
                context: context,
                title: "image1"))
      ]).height(bannerCtrl.isUploadSize ? Sizes.s150  : image!.isNotEmpty ?Sizes.s150 : Sizes.s50).width(Sizes.s200);
    });
  }
}

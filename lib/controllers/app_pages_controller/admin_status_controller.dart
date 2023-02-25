import 'dart:developer';


import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:video_player/video_player.dart';

import '../../config.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/helper_function.dart';

class AdminStatusController extends GetxController {
  late DropzoneViewController? controller1;
  VideoPlayerController? videoCtrl;
  bool dragging = false;
  Set<Uri> files = {};
  Image? image;
  File? video;
  io.File? videoFile;
  String imageName = "",
      imageUrl = "";
  Uint8List webImage = Uint8List(8);
  Uint8List uploadWebImage = Uint8List(8);
  io.File? pickImage;
  bool isUploadSize = false,
      isAlert = false;
  XFile? imageFile;

// GET IMAGE FROM GALLERY
  Future getImage({source, StateSetter? setState, dropImage, context}) async {
    if (dropImage != null) {
      if (imageName.contains("png") ||
          imageName.contains("jpg") ||
          imageName.contains("jpeg")) {
        var image = dropImage;
        uploadWebImage = image;
        Image image1 = Image.memory(uploadWebImage);

        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          webImage = uploadWebImage;
          pickImage = io.File("a");
          isUploadSize = false;
        } else {
          isUploadSize = true;
        }
        isAlert = false;
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    } else {
      final ImagePicker picker = ImagePicker();
      imageFile = (await picker.pickImage(source: ImageSource.gallery))!;
      log("imageFile : $imageFile");

      if (imageFile!.name.contains("png") ||
          imageFile!.name.contains("jpg") ||
          imageFile!.name.contains("jpeg")) {
        var image = await imageFile!.readAsBytes();
        uploadWebImage = image;

        Image image1 = Image.memory(uploadWebImage);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          webImage = uploadWebImage;
          pickImage = io.File(imageFile!.path);
          isUploadSize = false;
        } else {
          isUploadSize = true;
        }
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    }
  }

  //on click Image
  onImagePickUp(setState, context) {
    if (kIsWeb) {
      getImage(source: ImageSource.gallery, context: context);
    } else {
      imagePickerOption(
          setState: setState,
          cameraTap: () {
            getImage(
                source: ImageSource.camera,
                setState: setState,
                context: context);
            Get.back();
          },
          galleryTap: () {
            getImage(
                source: ImageSource.gallery,
                setState: setState,
                context: context);
            Get.back();
          });
    }
  }

  Future<void> onPlayVideo(File? file) async {
    if (file != null) {
      VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
        print("con3 : $controller");
      } else {
        controller = VideoPlayerController.file(File(file.path));
        print("con2 : $controller");
      }
      videoCtrl = controller;
      await controller.play();
      print("con : $controller");
      update();
    }
  }


  /* VideoPlayerController controller;
    controller = VideoPlayerController.file(File(file!.path));
    videoCtrl = controller;
    await controller.play();
    update();*/


  onSelectImage() async {
    final ImagePicker picker = ImagePicker();

   /* XFile? file = await picker.pickVideo(source: ImageSource.gallery);
    await onPlayVideo(file);*/

     File? videoFiles = (await ImagePickerWeb.getVideoAsFile()) as io.File?;
    await onPlayVideo(videoFiles);
   /* print("videos : $videoFile");
    video = videoFile;
    print("video : $video");
    videoCtrl = VideoPlayerController.file(video!)..initialize().then((_) {
      videoCtrl!.play();
      update();
    });*/
    /*var mediaData = await ImagePickerWeb.getImageInfo;
    image = Image.memory(mediaData!.data!);*/
    update();
  }
}
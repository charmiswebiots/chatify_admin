import 'dart:developer';
import 'dart:io' as io;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:video_player/video_player.dart';
import '../../config.dart';
import '../../screens/admin_status_screen/layouts/status_model.dart';
import '../../widgets/helper_function.dart';

class AdminStatusController extends GetxController {
  late DropzoneViewController? controller1;
  VideoPlayerController? videoCtrl;
  PickedFile? pickedFile;
  bool dragging = false;
  bool isLoading = false;
  Set<Uri> files = {};
  Image? image;
  File? video;
  String imageName = "",
      imageUrl = "";
  Uint8List webImage = Uint8List(8);
  Uint8List uploadWebImage = Uint8List(8);
  io.File? pickImage;
  bool isUploadSize = false,
      isAlert = false;
  XFile? imageFile;
  XFile? videoFile;

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

  //add status
  addStatus(imageUrl,statusType,{statusText,statusBgColor}) async {
       log("addStatus");
    List<PhotoUrl> statusImageUrls = [];

    var statusesSnapshot = await FirebaseFirestore.instance
        .collection(collectionName.adminStatus).get();
       log('snapShot: $statusesSnapshot');
    if (statusesSnapshot.docs.isNotEmpty) {
      Status status = Status.fromJson(statusesSnapshot.docs[0].data());
      statusImageUrls = status.photoUrl!;
      var data = {
        "image": imageUrl!,
        "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
        "isExpired": false,
        "statusType":statusType,
      };

      statusImageUrls.add(PhotoUrl.fromJson(data));
      await FirebaseFirestore.instance
          .collection(collectionName.adminStatus)
          .doc(statusesSnapshot.docs[0].id)
          .update(
          {'photoUrl': statusImageUrls.map((e) => e.toJson()).toList()});
      return;
    } else {
      var data = {
        "image": imageUrl!,
        "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
        "isExpired": false,
        "statusType":statusType,
      };
      statusImageUrls = [PhotoUrl.fromJson(data)];
    }

    Status status = Status(
        photoUrl: statusImageUrls,
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        isSeenByOwn: false);

    await FirebaseFirestore.instance.collection(collectionName.adminStatus).add(status.toJson());
  }

  Future uploadImage( {String? fileNameText}) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    log("reference : $webImage");
    UploadTask? uploadTask;
    uploadTask = reference.putData(webImage);

    uploadTask.then((res) async {
      log("res : $res");
      res.ref.getDownloadURL().then((downloadUrl) async {
        imageUrl = downloadUrl;
        log("imageUrl1 : $imageUrl");
        update();
        await Future.delayed(Durations.s3);
        onAddStatus();
      }, onError: (err) {
        update();
      });
    });
  }
  //add status
  onAddStatus() async {
    isLoading = true;
    update();
    log("imageUrl : $imageUrl");
    await addStatus(imageUrl,"image");
    isLoading = false;
    update();
  }

}
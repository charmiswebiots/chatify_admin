import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import '../../config.dart';
import '../../widgets/common_dotted_border.dart';
import '../../widgets/drag_drop_layout.dart';
import '../../widgets/image_pick_up.dart';

class AdminStatusScreen extends StatelessWidget {
  final StateSetter? setState;
  final adminStatusCtrl = Get.put(AdminStatusController());

   AdminStatusScreen({Key? key,this.setState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminStatusController>(
      builder: (adminStatusCtrl) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Admin Status",style: AppCss.nunitoSemiBold16.textColor(appCtrl.appTheme.blackColor)),
              const VSpace(Sizes.s20),
              SizedBox(
                height: 400,
                child:  adminStatusCtrl.video != null?    adminStatusCtrl.videoCtrl!.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: adminStatusCtrl.videoCtrl!.value.aspectRatio,
                  child: VideoPlayer(adminStatusCtrl.videoCtrl!),
                )
                    : Container() : Text("data")/*Stack(alignment: Alignment.centerLeft, children: [
                  DragDropLayout(
                      onCreated: (ctrl) => adminStatusCtrl.controller1 = ctrl,
                      onDrop: (ev) async {
                        log('Zone 1 drop: ${ev.name}');
                        adminStatusCtrl.imageName = ev.name;
                        adminStatusCtrl.update();
                        final bytes = await adminStatusCtrl.controller1!.getFileData(ev);
                        adminStatusCtrl.getImage(dropImage: bytes);
                      }),
                  adminStatusCtrl.imageUrl.isNotEmpty && adminStatusCtrl.pickImage != null
                      ? CommonDottedBorder(
                      child: Image.memory(adminStatusCtrl.webImage, fit: BoxFit.fill))
                      .inkWell(
                      onTap: () => adminStatusCtrl.getImage(
                          source: ImageSource.gallery, context: context))
                      : adminStatusCtrl.imageUrl.isNotEmpty
                      ? CommonDottedBorder(child: Image.network(adminStatusCtrl.imageUrl))
                      .inkWell(
                      onTap: () => adminStatusCtrl.getImage(
                          source: ImageSource.gallery, context: context))
                      : adminStatusCtrl.pickImage == null
                      ? const ImagePickUp().inkWell(
                      onTap: () =>
                          adminStatusCtrl.onImagePickUp(setState, context))
                      : CommonDottedBorder(
                      child: Image.memory(adminStatusCtrl.webImage,
                          fit: BoxFit.fill))
                      .inkWell(
                      onTap: () => adminStatusCtrl.getImage(
                          source: ImageSource.gallery, context: context))
                ])*/,
              ).backgroundColor(appCtrl.appTheme.error).inkWell(onTap: ()=> adminStatusCtrl.onSelectImage())
              /* SizedBox(
                  height: 200,
                  width: double.infinity,
                   child: DropTarget(
                         onDragDone: (urls) {
                           adminStatusCtrl.files.addAll(urls as Iterable<Uri>);
                               adminStatusCtrl.update();
                         },
                       child: Container(
                         child: const Text("Drop Files"),
                       )

                   ) *//*adminStatusCtrl.image ?? Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Icon(Icons.image),
                       const HSpace(Sizes.s5),
                       Text("Pick Image/Video",style: AppCss.nunitoBold14.textColor(appCtrl.appTheme.blackColor))
                     ],
                   )*//*,
                )*//*.inkWell(onTap: ()=> adminStatusCtrl.onSelectImage()).decorated(color: appCtrl.appTheme.error)*//*,*/
            ],
          ).paddingAll(Insets.i15)
        ).boxExtension();
      }
    );
  }
}

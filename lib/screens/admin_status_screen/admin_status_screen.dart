import 'dart:developer';
import '../../config.dart';

class AdminStatusScreen extends StatelessWidget {
  final StateSetter? setState;

  AdminStatusScreen({Key? key, this.setState}) : super(key: key);
  final adminStatusCtrl = Get.put(AdminStatusController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminStatusController>(
        builder: (_) {
          return SizedBox(
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sponsor", style: AppCss.nunitoSemiBold16.textColor(
                        appCtrl.appTheme.blackColor)),
                    const VSpace(Sizes.s20),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 400,
                              child: Stack(
                                  alignment: Alignment.center, children: [
                                DragDropLayout(
                                    onCreated: (ctrl) =>
                                    adminStatusCtrl.controller1 = ctrl,
                                    onDrop: (ev) async {
                                      log('Zone 1 drop: ${ev.name}');
                                      adminStatusCtrl.imageName = ev.name;
                                      adminStatusCtrl.update();
                                      final bytes = await adminStatusCtrl
                                          .controller1!.getFileData(ev);
                                      adminStatusCtrl.getImage(
                                          dropImage: bytes);
                                    }),
                                adminStatusCtrl.imageUrl.isNotEmpty &&
                                    adminStatusCtrl.pickImage != null
                                    ? CommonDottedBorder(
                                    child: Image.memory(
                                        adminStatusCtrl.webImage,
                                        fit: BoxFit.fill))
                                    .inkWell(
                                    onTap: () =>
                                        adminStatusCtrl.getImage(
                                            source: ImageSource.gallery,
                                            context: context))
                                    : adminStatusCtrl.imageUrl.isNotEmpty
                                    ? CommonDottedBorder(child: Image.network(
                                    adminStatusCtrl.imageUrl))
                                    .inkWell(
                                    onTap: () =>
                                        adminStatusCtrl.getImage(
                                            source: ImageSource.gallery,
                                            context: context))
                                    : adminStatusCtrl.pickImage == null
                                    ? const ImagePickUp().inkWell(
                                    onTap: () =>
                                        adminStatusCtrl.onImagePickUp(
                                            setState, context))
                                    : CommonDottedBorder(
                                    child: Image.memory(
                                        adminStatusCtrl.webImage,
                                        fit: BoxFit.fill))
                                    .inkWell(
                                    onTap: () =>
                                        adminStatusCtrl.getImage(
                                            source: ImageSource.gallery,
                                            context: context))
                              ])
                          ),
                          UpdateButton(title: "Add Status",
                              onPressed: adminStatusCtrl.imageFile != null
                                  ? () => adminStatusCtrl.uploadImage()
                                  : () {})
                        ])
                  ]).paddingAll(Insets.i15)).boxExtension();
        }
    );
  }
}

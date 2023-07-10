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
          return Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fonts.sponsor.tr,
                            style: AppCss.poppinsSemiBold16.textColor(
                                appCtrl.appTheme.blackColor)),
                        const VSpace(Sizes.s20),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: Sizes.s400,
                                  child: Stack(
                                      alignment: Alignment.center, children: [
                                    DragDropLayout(
                                        onCreated: (ctrl) =>
                                        adminStatusCtrl.controller1 = ctrl,
                                        onDrop: (ev) async {

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
                                        ? CommonDottedBorder(
                                        child: Image.network(
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
                              if (adminStatusCtrl.isAlert == true &&
                                  adminStatusCtrl.pickImage == null)
                                Text("Please Upload Image",
                                    style: AppCss.poppinsSemiBold14
                                        .textColor(appCtrl.appTheme.redColor)),
                              UpdateButton(title: fonts.addStatus,
                                  onPressed: adminStatusCtrl.imageFile != null
                                      ? () => adminStatusCtrl.uploadImage()
                                      : () {
                                    adminStatusCtrl.isAlert = true;
                                    adminStatusCtrl.update();
                                  }).paddingOnly(top: Insets.i15)
                            ])
                      ]).paddingAll(Insets.i10)).boxExtension(),
              if (adminStatusCtrl.isLoading)
                Container(
                    child: Text("Status Update Successfully",
                      style: AppCss.poppinsBold12.textColor(
                          appCtrl.appTheme.whiteColor),
                    ).paddingAll(Insets.i10).decorated(
                        color: appCtrl.appTheme.green,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r50)))).paddingSymmetric(horizontal: Insets.i15,vertical: Insets.i15)
            ]
          );
        }
    );
  }
}

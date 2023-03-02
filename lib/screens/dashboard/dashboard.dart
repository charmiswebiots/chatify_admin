import 'package:flutter_svg/flutter_svg.dart';
import '../../config.dart';
import '../../controllers/app_pages_controller/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              gridDelegate: Responsive.isMobile(context)
                  ? const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 205,
                    )
                  : MediaQuery.of(context).size.width < 1500
                      ? const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 205,
                        )
                      : SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              MediaQuery.of(context).size.width * 0.24,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 205,
                        ),
              itemCount: dashboardCtrl.listItem.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Stack(children: [
                      Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: appCtrl.appTheme.accentTxt,
                              borderRadius: BorderRadius.circular(18.0)),
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        dashboardCtrl.listItem[index]["title"]
                                            .toString()
                                            .tr,
                                        style: AppCss.nunitoSemiBold16
                                            .textColor(appCtrl.appTheme.white)
                                            .letterSpace(1.3)),
                                    SvgPicture.asset(
                                        dashboardCtrl.listItem[index]["icon"],
                                        color: appCtrl.appTheme.white),
                                  ],
                                ),
                                Text(
                                    index == 0
                                        ? dashboardCtrl.totalUser.toString()
                                        : index == 1
                                            ? dashboardCtrl.totalCalls
                                                .toString()
                                            : index == 2
                                                ? dashboardCtrl.videoCall
                                                    .toString()
                                                : dashboardCtrl.audioCall
                                                    .toString(),
                                    style: AppCss.nunitoSemiBold24
                                        .textColor(appCtrl.appTheme.white)),
                              ])),
                      Positioned(
                          right: -75.0,
                          top: -25.0,
                          child: Container(
                              height: 175,
                              width: 175,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appCtrl.appTheme.whiteColor
                                      .withOpacity(0.15)))),
                      Positioned(
                          bottom: -87.5,
                          right: -37.5,
                          child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appCtrl.appTheme.whiteColor
                                    .withOpacity(0.15),
                              )))
                    ]));
              }));
    });
  }
}

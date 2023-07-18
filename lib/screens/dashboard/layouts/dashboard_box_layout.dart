import 'package:chatify_admin/screens/dashboard/layouts/dashboard_title_count.dart';
import 'package:figma_squircle/figma_squircle.dart';
import '../../../config.dart';

class DashboardBoxLayout extends StatelessWidget {
  final int? index;

  const DashboardBoxLayout({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (dashboardCtrl) {
      return Container(
              height: Sizes.s177,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: const Alignment(8, 9 ),
                      end: const Alignment(-9, -8),
                      colors: [
                        appCtrl.appTheme.primary.withOpacity(.1),
                        Colors.white,
                        Colors.white
                      ]),
                  borderRadius: BorderRadius.circular(Insets.i16)),
              padding: const EdgeInsets.all(Insets.i40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DashboardTitleCount(
                              count: index == 0
                                  ? dashboardCtrl.totalUser.toString()
                                  : index == 1
                                      ? dashboardCtrl.totalCalls
                                          .toString(): index == 2
                                      ? dashboardCtrl.videoCall
                                          .toString()
                                      : dashboardCtrl.audioCall.toString(),
                              title: dashboardCtrl.listItem[index!]["title"]
                                  .toString()
                                  .tr),
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r13),
                              child: SvgPicture.asset(
                                      dashboardCtrl.listItem[index!]["icon"])

                                  .decorated(
                                      color: appCtrl.appTheme.primary,
                                      borderRadius: SmoothBorderRadius(
                                          cornerRadius: 13,
                                          cornerSmoothing: 1)))
                        ])
                  ]))
          .paddingAll(Insets.i4)
          .decorated(
              borderRadius: BorderRadius.circular(Insets.i18),
              boxShadow: [
                const BoxShadow(
                    color: Color.fromRGBO(49, 100, 189, 0.07),
                    blurRadius: 20)
              ],
              color: appCtrl.appTheme.whiteColor);
    });
  }
}

import 'package:chatify_admin/screens/dashboard/layouts/country_user_count.dart';
import 'package:chatify_admin/screens/dashboard/layouts/dashboard_box_layout.dart';
import 'package:chatify_admin/screens/dashboard/layouts/user_layout.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';


import '../../config.dart';
import 'layouts/user_pagination.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      return Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate: Responsive.isMobile(context)
                          ? const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 100,
                      )
                          : MediaQuery.of(context).size.width < 1500
                          ? const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 100,
                      )
                          : const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 120,
                      ),
                      itemCount: dashboardCtrl.listItem.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return DashboardBoxLayout(index: index);
                      }),
                ),
                const HSpace(Sizes.s20),
                if (Responsive.isDesktop(context))
                  Expanded(
                    flex: 2,
                    child: SmoothContainer(
                        color:  appCtrl.isTheme
                            ? appCtrl.appTheme.accentTxt
                            : appCtrl.appTheme.white,
                        height: 240,
                        padding: const EdgeInsets.symmetric(
                            horizontal: Insets.i20, vertical: Insets.i23),
                        smoothness: 1,
                        borderRadius: BorderRadius.circular(Insets.i8),
                        side: BorderSide(
                            color:
                            appCtrl.appTheme.textColor.withOpacity(.15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectableText(
                                fonts.top5Country.tr,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    color: appCtrl.isTheme
                                        ? appCtrl.appTheme.white
                                        : appCtrl.appTheme.blackText),
                              ),
                              const VSpace(Sizes.s24),
                              Divider(
                                height: 0,
                                color: appCtrl.isTheme
                                    ? appCtrl.appTheme.white
                                    : appCtrl.appTheme.dark.withOpacity(.12),
                              ),
                              const VSpace(Sizes.s20),
                              Row(
                                children: [
                                  CountryUserCount(
                                    image: imageAssets.india,
                                    title: fonts.india.tr,
                                    count:
                                    dashboardCtrl.totalIndiaUser.toString(),
                                  ),
                                  const HSpace(Sizes.s25),
                                  CountryUserCount(
                                      image: imageAssets.us,
                                      title: fonts.us.tr,
                                      count:
                                      dashboardCtrl.totalUsUser.toString()),
                                  const HSpace(Sizes.s25),
                                  CountryUserCount(
                                      image: imageAssets.pakistan,
                                      title: fonts.pakistan.tr,
                                      count: dashboardCtrl.totalPakistanUser
                                          .toString()),
                                  const HSpace(Sizes.s25),
                                  CountryUserCount(
                                      image: imageAssets.bangla,
                                      title: fonts.bangladesh.tr,
                                      count: dashboardCtrl.totalBangladeshUser
                                          .toString()),
                                  const HSpace(Sizes.s25),
                                  CountryUserCount(
                                      image: imageAssets.turkey,
                                      title: fonts.turkey.tr,
                                      count: dashboardCtrl.totalTurkeyUser
                                          .toString()),
                                ],
                              )
                            ])).boxExtension(),
                  ),
              ],
            ).height(Sizes.s250),
          ),
          if (!Responsive.isDesktop(context)) const VSpace(Sizes.s20),
          if (!Responsive.isDesktop(context))
            SmoothContainer(
                color:  appCtrl.isTheme
                    ? appCtrl.appTheme.accentTxt
                    : appCtrl.appTheme.white,
                height: 240,
                padding: const EdgeInsets.symmetric(
                    horizontal: Insets.i20, vertical: Insets.i23),
                smoothness: 1,
                borderRadius: BorderRadius.circular(Insets.i8),
                side: BorderSide(
                    color: appCtrl.appTheme.textColor.withOpacity(.15)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SelectableText(
                        fonts.top5Country.tr,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: appCtrl.isTheme
                                ? appCtrl.appTheme.white
                                : appCtrl.appTheme.blackText),
                      ),
                      const VSpace(Sizes.s24),
                      Divider(
                        height: 0,
                        color: appCtrl.isTheme
                            ? appCtrl.appTheme.white
                            : appCtrl.appTheme.dark.withOpacity(.12),
                      ),
                      const VSpace(Sizes.s20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CountryUserCount(
                              image: imageAssets.india,
                              title: fonts.india.tr,
                              count: dashboardCtrl.totalIndiaUser.toString(),
                            ),
                            const HSpace(Sizes.s25),
                            CountryUserCount(
                                image: imageAssets.us,
                                title: fonts.us.tr,
                                count: dashboardCtrl.totalUsUser.toString()),
                            const HSpace(Sizes.s25),
                            CountryUserCount(
                                image: imageAssets.pakistan,
                                title: fonts.pakistan.tr,
                                count:
                                dashboardCtrl.totalPakistanUser.toString()),
                            const HSpace(Sizes.s25),
                            CountryUserCount(
                                image: imageAssets.bangla,
                                title: fonts.bangladesh.tr,
                                count: dashboardCtrl.totalBangladeshUser
                                    .toString()),
                            const HSpace(Sizes.s25),
                            CountryUserCount(
                                image: imageAssets.turkey,
                                title: fonts.turkey.tr,
                                count:
                                dashboardCtrl.totalTurkeyUser.toString()),
                          ],
                        ),
                      )
                    ])).boxExtension(),
          const VSpace(Sizes.s20),
          SmoothContainer(
              color:  appCtrl.isTheme
                  ? appCtrl.appTheme.accentTxt
                  : appCtrl.appTheme.white,
              padding: const EdgeInsets.symmetric(
                  vertical: Insets.i23),
              smoothness: 1,
              borderRadius: BorderRadius.circular(Insets.i8),
              side: BorderSide(
                  color: appCtrl.appTheme.textColor.withOpacity(.15)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectableText(
                          fonts.recentJoin.tr,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color:appCtrl.isTheme  ?  appCtrl.appTheme.white: appCtrl.appTheme.blackText),
                        ),
                        SelectionArea(
                          child: CommonTextBox(
                              fillColor: appCtrl.appTheme.gray.withOpacity(0.1),
                              filled: true,
                              controller: dashboardCtrl.textSearch,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(AppRadius.r5),
                                borderSide: BorderSide.none,
                              ),
                              onChanged: (value) =>
                                  dashboardCtrl.filterData(value),
                              hinText: fonts.searchHere.tr)
                              .width(Responsive.isDesktop(context) ? 514 : 200),
                        ),
                      ],
                    ).paddingSymmetric(   horizontal: Insets.i22),
                    const VSpace(Sizes.s20),
                    StreamBuilder(
                        stream: dashboardCtrl.textSearch.text.isNotEmpty
                            ? dashboardCtrl.searchList()
                            : dashboardCtrl.listenToChatsRealTime(),
                        builder: (context, snapShot) {
                          if (snapShot.hasData) {

                            return UserLayoutDesktop(snapShot: snapShot);
                          } else {
                            return Container();
                          }
                        }).paddingSymmetric(   horizontal: Insets.i22),
                    DottedLine(
                        direction:  Axis.horizontal,
                        lineLength:  double.infinity,
                        lineThickness: 1,
                        dashLength: 2,
                        dashColor:appCtrl.appTheme.txt.withOpacity(0.20)),
                    const VSpace(Sizes.s20),
                    const UserPagination().paddingSymmetric(horizontal: Insets.i45)
                  ])).boxExtension(),
        ],
      );
    });
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

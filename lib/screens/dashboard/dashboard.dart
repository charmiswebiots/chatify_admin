import '../../config.dart';

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
                return Container(
                        height: Sizes.s177,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: const Alignment(9, 8),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              index == 0
                                                  ? dashboardCtrl.totalUser
                                                      .toString()
                                                  : index == 1
                                                      ? dashboardCtrl.totalCalls
                                                          .toString()
                                                      : index == 2
                                                          ? dashboardCtrl
                                                              .videoCall
                                                              .toString()
                                                          : dashboardCtrl
                                                              .audioCall
                                                              .toString(),
                                              style: AppCss.poppinsSemiBold24
                                                  .textColor(
                                                      appCtrl.appTheme.number)),
                                          const VSpace(Sizes.s15),
                                          Text(
                                              dashboardCtrl.listItem[index]
                                                      ["title"]
                                                  .toString()
                                                  .tr,
                                              style: AppCss.poppinsMedium16
                                                  .textColor(
                                                      appCtrl.appTheme.gray)
                                                  .letterSpace(1.3))
                                        ]),
                                    SvgPicture.asset(
                                        dashboardCtrl.listItem[index]["icon"])
                                  ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("0%",style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.gray)),
                                  Text("89%",style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.primary))
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: Sizes.s10,
                                    overlayShape: SliderComponentShape.noOverlay,
                                    thumbColor: Colors.transparent,
                                    thumbShape: SliderComponentShape.noThumb),
                                child: Slider(
                                  value: 50,
                                  max: 100,
                                  min: 0,
                                  activeColor: appCtrl.appTheme.primary,
                                  inactiveColor: appCtrl.appTheme.primaryLight.withOpacity(0.1),
                                  onChanged: (double value) {},
                                ),
                              ),
                            ])) 
                    .paddingAll(Insets.i4)
                    .decorated(
                        borderRadius: BorderRadius.circular(Insets.i18),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(49, 100, 189, 0.07),
                              blurRadius: 20)
                        ],
                        color: appCtrl.appTheme.whiteColor);
              }));
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
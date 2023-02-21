import '../../config.dart';

class UsageControlScreen extends StatelessWidget {
  const UsageControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Responsive.isMobile(context) || Responsive.isTablet(context) ?  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("data"),
                      Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: false, onChanged: (val) {}),
                    ],
                  ),
                  Column(
                    children: [
                      Text("data"),
                      Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: false, onChanged: (val) {}),
                    ],
                  ),
                  Column(
                    children: [
                      Text("data"),
                      Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: false, onChanged: (val) {}),
                    ],
                  ),
                ],
              ).paddingAll(Insets.i15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("data"),
                      Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: false, onChanged: (val) {}),
                    ],
                  ),
                  Column(
                    children: [
                      Text("data"),
                      Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: false, onChanged: (val) {}),
                    ],
                  ),
                  Column(
                    children: [
                      Text("data"),
                      Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: false, onChanged: (val) {}),
                    ],
                  ),
                ],
              ).paddingAll(Insets.i15),
            ],
          ) :

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data"),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false, onChanged: (val) {}),
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data"),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false, onChanged: (val) {}),
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data"),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false, onChanged: (val) {}),
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data"),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false, onChanged: (val) {}),
                ],
              ),
            ],
          )
        ],
      )
    ).decorated(color: appCtrl.appTheme.white,borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),boxShadow:[
      BoxShadow(
        color: appCtrl.appTheme.greyLight25,
        spreadRadius: 5,blurRadius: 5
      )
    ],);
  }
}

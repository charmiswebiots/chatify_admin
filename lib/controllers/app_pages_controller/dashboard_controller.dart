import 'package:cloud_firestore/cloud_firestore.dart';
import '../../config.dart';

class DashboardController extends GetxController{
  int totalUser = 0;
  int totalCalls = 0;

  @override
  void onReady() async{
    totalUser = await FirebaseFirestore.instance.collection(collectionName.users).get().then((value) => value.size);
     await FirebaseFirestore.instance.collection(collectionName.calls).get().then((value)  {
       totalCalls = value.docs.length;
    });
    update();

    // TODO: implement onReady
    super.onReady();
  }


  final List<Map<String, dynamic>> listItem = [
    {
      'title': "totalUser",
      'icon': svgAssets.groups
    },
    {
      'title': 'totalCalls',
      'icon': svgAssets.call
    },
    {
      'title': 'totalVideoCall',
      'icon': svgAssets.videoCall
    },
    {
      'title': 'totalAudioCall',
      'icon': svgAssets.call
    },
  ];
}

class UserAppSettingModel {
  String? approvalMessage,
      maintenanceMessage,
      rateApp,
      rateAppIos,
      bannerAndroidId,
      bannerIOSId,
      facebookAddAndroidId,
      facebookAddIOSId,gifAPI,firebaseServerToken;
  bool? allowUserBlock,
      approvalNeeded,
      isAdmobEnable,
      isGoogleAdEnable,
      isMaintenanceMode,isFacebookAdEnable;

  UserAppSettingModel({
    this.approvalMessage,
    this.maintenanceMessage,
    this.rateApp,
    this.rateAppIos,
    this.bannerAndroidId,
    this.bannerIOSId,
    this.facebookAddAndroidId,
    this.facebookAddIOSId,
    this.gifAPI,
    this.firebaseServerToken,
    this.allowUserBlock,
    this.approvalNeeded,
    this.isAdmobEnable,
    this.isGoogleAdEnable,
    this.isMaintenanceMode,
    this.isFacebookAdEnable,
  });

  UserAppSettingModel.fromJson(Map<String, dynamic> json) {
    approvalMessage = json['approvalMessage'] ??
        "You can start using Chatter once the admin approves it.";
    maintenanceMessage = json['maintenanceMessage'] ?? "";
    rateApp = json['rateApp'] ?? "";
    rateAppIos = json['rateAppIos'] ?? "";
    bannerAndroidId = json['bannerAndroidId'] ?? "";
    bannerIOSId = json['bannerIOSId'] ?? "";
    facebookAddAndroidId = json['facebookAddAndroidId'] ?? "";
    facebookAddIOSId = json['facebookAddIOSId'] ?? "";
    gifAPI = json['gifAPI'] ?? "";
    firebaseServerToken = json['firebaseServerToken'] ?? "";
    allowUserBlock = json['allowUserBlock'] ?? true;
    approvalNeeded = json['approvalNeeded'] ?? true;
    isAdmobEnable = json['isAdmobEnable'] ?? true;
    isGoogleAdEnable = json['isGoogleAdEnable'] ?? true;
    isMaintenanceMode = json['isMaintenanceMode'] ?? false;
    isFacebookAdEnable = json['isGoogleAdEnable'] == true ? false : true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['approvalMessage'] = approvalMessage;
    data['maintenanceMessage'] = maintenanceMessage;
    data['rateApp'] = rateApp;
    data['rateAppIos'] = rateAppIos;
    data['bannerAndroidId'] = bannerAndroidId;
    data['bannerIOSId'] = bannerIOSId;
    data['facebookAddAndroidId'] = facebookAddAndroidId;
    data['facebookAddIOSId'] = facebookAddIOSId;
    data['gifAPI'] = gifAPI;
    data['firebaseServerToken'] = firebaseServerToken;
    data['allowUserBlock'] = allowUserBlock;
    data['approvalNeeded'] = approvalNeeded;
    data['isAdmobEnable'] = isAdmobEnable;
    data['isGoogleAdEnable'] = isGoogleAdEnable;
    data['isMaintenanceMode'] = isMaintenanceMode;
    data['isFacebookAdEnable'] = isFacebookAdEnable;
    return data;
  }
}

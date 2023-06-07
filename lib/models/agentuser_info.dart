class AgentUserInfo {
  int? id;
  String? SNSKey;
  String? LicenseURL;
  bool? isPermitted;

  AgentUserInfo({
    this.SNSKey,
    this.LicenseURL,
  });

  AgentUserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    SNSKey = json['SNSKey'];
    LicenseURL = json['LicenseURL'];
    isPermitted = json['isPermitted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['SNSKey'] = this.SNSKey;
    data['LicenseURL'] = this.LicenseURL;
    data['isPermitted'] = this.isPermitted;
    return data;
  }
}

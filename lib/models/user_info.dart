class UserInfo {
  String? SNSKey;
  String? Name;
  String? BirthDay;
  String? Tel;

  UserInfo({
    this.SNSKey,
    this.Name,
    this.BirthDay,
    this.Tel,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    SNSKey = json['SNSKey'];
    Name = json['Name'];
    BirthDay = json['BirthDay'];
    Tel = json['Tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SNSKey'] = this.SNSKey;
    data['Name'] = this.Name;
    data['BirthDay'] = this.BirthDay;
    data['Tel'] = this.Tel;
    return data;
  }
}

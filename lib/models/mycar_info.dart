class MyCarInfo {
  int? id;
  String? name;
  String? carNumber;
  String? vehicleRegistrationCertificateURL;
  bool? isPermitted;
  String? SNSKey;

  MyCarInfo(
      {this.id,
      this.name,
      this.carNumber,
      this.vehicleRegistrationCertificateURL,
      this.isPermitted,
      this.SNSKey});

  MyCarInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    carNumber = json['CarNumber'];
    vehicleRegistrationCertificateURL =
        json['VehicleRegistrationCertificateURL'];
    isPermitted = json['isPermitted'];
    SNSKey = json['SNSKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['CarNumber'] = this.carNumber;
    data['VehicleRegistrationCertificateURL'] =
        this.vehicleRegistrationCertificateURL;
    data['isPermitted'] = this.isPermitted;
    data['SNSKey'] = this.SNSKey;
    return data;
  }
}

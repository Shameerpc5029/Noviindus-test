class AdddriverModel {
  final String name;
  final String mobile;
  final String licenseNo;

  AdddriverModel({
    required this.name,
    required this.mobile,
    required this.licenseNo,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
      'license_no': licenseNo,
    };
  }
}

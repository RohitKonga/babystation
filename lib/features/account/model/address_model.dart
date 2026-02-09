class AddressModel {
  final int id;
  final String name;
  final String phoneNo;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String pincode;
  final String? landmark;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNo,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.pincode,
    this.landmark,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phoneNo: json['phone_no'] ?? '',
      addressLine1: json['address_line_1'] ?? '',
      addressLine2: json['address_line_2'] ?? '',
      city: json['city'] ?? '',
      pincode: json['pincode'].toString(),
      landmark: json['landmark'] ?? '',
      isDefault: json['default'] == 1,
    );
  }
}

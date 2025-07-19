class RegistrationModel {
  final int weekBefore;
  final DateTime createdAt;
  final bool isDelivered;
  final DateTime? deliveryDate;
  final DateTime? edd;
  final String id;
  final String fullName;
  final String deviceToken;

  RegistrationModel({
    required this.weekBefore,
    required this.createdAt,
    required this.isDelivered,
    this.deliveryDate,
    this.edd,
    required this.id,
    required this.fullName,
    required this.deviceToken,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      weekBefore: json['weekBefore'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['createdAt'].toString()) * 1000),
      isDelivered: json['IsDelivered'] ?? false, // Fallback to false if null
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              int.parse(json['deliveryDate'].toString()) * 1000)
          : null,
      edd: json['expectedDeliveryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              int.parse(json['expectedDeliveryDate'].toString()) * 1000)
          : null,
      id: json['_id'],
      fullName: json['fullName'],
      deviceToken: json['deviceToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weekBefore': weekBefore,
      'createdAt': (createdAt.millisecondsSinceEpoch / 1000).round().toString(),
      'IsDelivered': isDelivered,
      'deliveryDate': deliveryDate != null
          ? (deliveryDate!.millisecondsSinceEpoch / 1000).round().toString()
          : null,
      'expectedDeliveryDate': edd != null
          ? (edd!.millisecondsSinceEpoch / 1000).round().toString()
          : null,
      '_id': id,
      'fullName': fullName,
      'deviceToken': deviceToken,
    };
  }
}

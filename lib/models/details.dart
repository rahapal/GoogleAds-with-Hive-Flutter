import 'package:hive/hive.dart';

part 'details.g.dart';

@HiveType(typeId: 0)
class Details {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String address;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String image;

  Details({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.image,
  });

  Details copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? image,
  }) {
    return Details(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      image: image ?? this.image,
    );
  }
}

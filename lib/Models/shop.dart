// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

var uuid = Uuid();
final namespace = Uuid.NAMESPACE_URL;

class Shop {
  String id;
  String title;
  String description;
  String imagePath;
  double price;
  Shop({
    String? id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
  }) : id = id ?? uuid.v5(namespace, title).toString();

  Shop copyWith({
    String? title,
    String? description,
    String? imagePath,
    double? price,
  }) {
    return Shop(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'price': price,
    };
  }

  factory Shop.fromMap(String id, Map<String, dynamic> map) {
    return Shop(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      imagePath: map['imagePath'] as String,
      price: map['price'] as double,
    );
  }

  @override
  String toString() {
    return 'Shop(id: $id, title: $title, description: $description, imagePath: $imagePath, price: $price)';
  }

  @override
  bool operator ==(covariant Shop other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.imagePath == imagePath &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imagePath.hashCode ^
        price.hashCode;
  }
}

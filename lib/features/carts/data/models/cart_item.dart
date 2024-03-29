import 'package:hive/hive.dart';
import 'package:thepos/features/home/data/models/product.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 4)
class CartItem {
  CartItem({
     this.id,
    required this.product,
    required this.quantity,
     this.sellingPrice,
  });


  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'],
        quantity: json["quantity"],
        sellingPrice:json["selling_price"],
        product: Product.fromJson(json["product"]),
      );
  @HiveField(0)
  String ?id;
  @HiveField(1)
  Product product;
  @HiveField(2)
  int quantity;
  @HiveField(3)
  double? sellingPrice;

  Map<String, dynamic> toJson() => <String, >{
        "id": id,
        "quantity": quantity,
        "selling_price":sellingPrice,
        "product": product.toJson(),
      };

  double? get getPrice =>sellingPrice ?? product.price;

  // todo calculate taxed selling price
  double get taxedSellingPrice=>getPrice!;
}

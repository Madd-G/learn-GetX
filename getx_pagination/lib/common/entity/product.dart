class Data {
  List<Product> products;
  int total;
  int skip;
  int limit;

  Data({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      products:
          List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
    );
  }
}

class Product {
  int id;
  String title;

  Product({
    required this.id,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
    );
  }
}

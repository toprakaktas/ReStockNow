class Item {
  final String url;
  final bool inStock;

  Item({required this.url, required this.inStock});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      url: json['url'],
      inStock: json['inStock'],
    );
  }
}

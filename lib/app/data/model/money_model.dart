class Money {
  double? price;
  String? name;
  Money({
    this.price = 0.0,
    this.name = "",
  }) : assert(
          name != null && name.isNotEmpty,
          price != null && price >= 0,
        );
}

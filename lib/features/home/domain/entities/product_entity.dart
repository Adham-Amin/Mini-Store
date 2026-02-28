class ProductEntity {
  final int idProduct;
  final String name;
  final String overview;
  final num priceProduct;
  final num rate;
  final num count;
  final String imageUrl;

  ProductEntity({
    required this.idProduct,
    required this.name,
    required this.rate,
    required this.count,
    required this.overview,
    required this.priceProduct,
    required this.imageUrl,
  });
}

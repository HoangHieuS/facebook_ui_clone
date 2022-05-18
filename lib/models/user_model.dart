class User {
  final String name;
  final String imageUrl;
  final bool isOnlined;

  const User({
    required this.name,
    required this.imageUrl,
    this.isOnlined = true,
  });
}

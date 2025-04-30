import 'dart:math';

String getRandomProductName() {
  final brands = ['Samsung', 'Apple', 'Sony', 'LG', 'Xiaomi', 'Dell', 'HP'];
  final categories = ['Phone', 'Laptop', 'TV', 'Headphones', 'Tablet', 'Monitor'];
  final adjectives = ['Pro', 'Max', 'Ultra', 'Lite', 'Plus', 'Mini', 'Air'];
  final rand = Random();

  final brand = brands[rand.nextInt(brands.length)];
  final category = categories[rand.nextInt(categories.length)];
  final adjective = adjectives[rand.nextInt(adjectives.length)];
  final modelNumber = rand.nextInt(9999).toString().padLeft(4, '0');

  return '$brand $category $adjective $modelNumber';
}

String generateRandomProductId() {
  final prefix = ['P', 'X', 'Z', 'Q', 'M'];
  final rand = Random();

  final code = prefix[rand.nextInt(prefix.length)];
  final number = rand.nextInt(999999).toString().padLeft(6, '0');

  return '$code$number'; // Ej: P004231
}

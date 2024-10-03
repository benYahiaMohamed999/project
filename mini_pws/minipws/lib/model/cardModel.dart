// ignore_for_file: file_names

class CardModel {
  final String person; // The person's name or other identifier
  final double price; // Use double for price
  final String image; // URL or path to the image

  CardModel({
    required this.person,
    required this.price,
    required this.image,
  });
}
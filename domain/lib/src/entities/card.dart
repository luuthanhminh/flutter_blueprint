import 'package:meta/meta.dart';

class Card {
  String header;
  String description;
  List<String> images;

  Card({
    @required this.header,
    @required this.description,
    @required this.images
  });
}
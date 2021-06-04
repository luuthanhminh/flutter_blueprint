import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel extends Card {
  CardModel(
      {required String header,
      required String description,
      required List<String> images})
      : super(header: header, description: description, images: images);

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}

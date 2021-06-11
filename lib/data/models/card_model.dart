import 'package:fl_blueprint/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel extends DCard {
  CardModel(
      {required String header,
      required String description,
      required List<String> images})
      : super(header: header, description: description, images: images);

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}

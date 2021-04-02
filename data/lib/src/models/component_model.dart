import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'component_model.g.dart';

@JsonSerializable()
class ComponentModel extends Component {
  ComponentModel({
    @required String text,
    @required String url,
  }) : super(text: text, url: url);

  factory ComponentModel.fromJson(Map<String, dynamic> json) => _$ComponentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentModelToJson(this);
}
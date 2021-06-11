import 'dart:convert';
import 'package:fl_blueprint/data/data.dart';
import 'package:flutter/services.dart';

abstract class ComponentsDataSource {
  Future<List<ComponentModel>> getComponents();
}

class LocalComponentsDataSourceImpl extends ComponentsDataSource {
  final fileSource = 'assets/data/components.json';

  @override
  Future<List<ComponentModel>> getComponents() async {
    // Return data after 2 seconds
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString(fileSource);
    final decodedData = jsonDecode(json);
    return (decodedData as List)
        .map((e) => ComponentModel.fromJson(e))
        .toList();
  }
}

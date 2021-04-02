import 'dart:convert';
import 'package:data/src/models/component_model.dart';
import 'package:flutter/services.dart';


abstract class IComponentsDataSource {
  Future<List<ComponentModel>> getComponents();
}

class LocalComponentsDataSourceImpl extends IComponentsDataSource {

  final file_source = 'assets/data/components.json';

  @override
  Future<List<ComponentModel>> getComponents() async {
    // Return data after 2 seconds
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString(file_source);
    final decodedData = jsonDecode(json);
    return (decodedData as List).map((e) => ComponentModel.fromJson(e)).toList();
  }
}
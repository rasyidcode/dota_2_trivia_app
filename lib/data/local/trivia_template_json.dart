import 'dart:convert';

import 'package:dota_2_trivia_app/data/model/template/template_item.dart';
import 'package:flutter/services.dart' show rootBundle;

class TriviaTemplateData {
  Future<TemplateItem> getRandomTemplate() async {
    final templatesString =
        await rootBundle.loadString('assets/trivia_templates.json');
    final templateData = jsonDecode(templatesString) as Map<String, dynamic>;
    // final template = ((templateData['data'] as List)..shuffle()).take(1).first
    //     as Map<String, dynamic>;
    final template =
        (templateData['data'] as List).first as Map<String, dynamic>;

    return TemplateItem.fromJson(template);
  }
}

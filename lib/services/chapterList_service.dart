import 'dart:convert';
import 'package:api_demo/models/chapter_model.dart';
import 'package:api_demo/services/const.dart';
import 'package:http/http.dart' as http;

class ChapterService {
 

  Future<ChapterModel> getChapter() async {
    final body = {
      'login_id': '4',
      'course_chapter_id': '1',
    };
   
    final response = await http.post(Uri.parse(ApiUrl.baseurl + ApiUrl.endPoint),
        body: body);
    if (response.statusCode == 200) {
      String data = response.body;
      
      return ChapterModel.fromJson(json.decode(data));
    } else {
      throw Exception('Failed to get chapter data');
    }
  }
}

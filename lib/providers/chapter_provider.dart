import 'package:flutter/material.dart';
import 'package:api_demo/models/chapter_model.dart';
import '../services/chapterList_service.dart';

class ChapterProvider extends ChangeNotifier {
  final _service = ChapterService();
  bool isLoading = false;
  ChapterModel? _chapterModel;
  ChapterModel? get chapterList => _chapterModel;

  Future<void> getChapters() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getChapter();

    _chapterModel = response;
    isLoading = false;
    notifyListeners();
  }
}
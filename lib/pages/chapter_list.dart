import 'package:api_demo/models/chapter_model.dart';
import 'package:api_demo/providers/chapter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterList extends StatefulWidget {
  const ChapterList({Key? key}) : super(key: key);

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ChapterProvider>(context, listen: false).getChapters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),
      body: Consumer<ChapterProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final chapterData = value.chapterList;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: chapterData?.data?.length ?? 0,
            itemBuilder: (context, index) {
              final chapter = chapterData?.data?[index];
              return ListView.builder(
                shrinkWrap: true,
                itemCount:
                    chapterData?.data?[index].chapterItemMedia?.length ?? 0,
                itemBuilder: (context, i) {
                  final mediaChapter =
                      chapterData?.data?[index].chapterItemMedia?[i];
                  return customTile(chapter, mediaChapter);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget customTile(Data? chapter, ChapterItemMedia? mediaChapter) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(width: 0.4),
            ),
            child: mediaChapter!.mediaType == '0'
                ? const Icon(Icons.file_copy)
                : Image.network(mediaChapter.thumbImage!, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              chapter?.chapterItemName ?? '',
            ),
          ),
          Text(
            chapter?.days ?? '',
          ),
        ],
      ),
    );
  }
}

class ChapterModel {
  int? flag;
  String? msg;
  List<Data>? data;

  ChapterModel({this.flag, this.msg, this.data});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['flag'] = this.flag;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? chapterItemId;
  String? ciId;
  String? courseId;
  String? courseChapterId;
  String? chapterItemName;
  String? days;
  String? status;
  String? createdAt;
  String? lastUpdate;
  List<ChapterItemMedia>? chapterItemMedia;

  Data(
      {this.chapterItemId,
      this.ciId,
      this.courseId,
      this.courseChapterId,
      this.chapterItemName,
      this.days,
      this.status,
      this.createdAt,
      this.lastUpdate,
      this.chapterItemMedia});

  Data.fromJson(Map<String, dynamic> json) {
    chapterItemId = json['chapter_item_id'];
    ciId = json['ci_id'];
    courseId = json['course_id'];
    courseChapterId = json['course_chapter_id'];
    chapterItemName = json['chapter_item_name'];
    days = json['days'];
    status = json['status'];
    createdAt = json['created_at'];
    lastUpdate = json['last_update'];
    if (json['chapter_item_media'] != null) {
      chapterItemMedia = <ChapterItemMedia>[];
      json['chapter_item_media'].forEach((v) {
        chapterItemMedia!.add(new ChapterItemMedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['chapter_item_id'] = this.chapterItemId;
    data['ci_id'] = this.ciId;
    data['course_id'] = this.courseId;
    data['course_chapter_id'] = this.courseChapterId;
    data['chapter_item_name'] = this.chapterItemName;
    data['days'] = this.days;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['last_update'] = this.lastUpdate;
    if (this.chapterItemMedia != null) {
      data['chapter_item_media'] =
          this.chapterItemMedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChapterItemMedia {
  String? chapterItemId;
  String? chapterMedia;
  String? thumbImage;
  String? mediaType;

  ChapterItemMedia(
      {this.chapterItemId, this.chapterMedia, this.thumbImage, this.mediaType});

  ChapterItemMedia.fromJson(Map<String, dynamic> json) {
    chapterItemId = json['chapter_item_id'];
    chapterMedia = json['chapter_media'];
    thumbImage = json['thumb_image'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['chapter_item_id'] = this.chapterItemId;
    data['chapter_media'] = this.chapterMedia;
    data['thumb_image'] = this.thumbImage;
    data['media_type'] = this.mediaType;
    return data;
  }
}

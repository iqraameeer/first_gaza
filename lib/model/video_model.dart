// lib/model/video_model.dart

class VideoModel {
  final String title;
  final String link;
  final String thumbnail;

  VideoModel({required this.title, required this.link, required this.thumbnail});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      title: json['title'],
      link: json['link'],
      thumbnail: json['thumbnail'],
    );
  }
}
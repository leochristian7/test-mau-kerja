import 'package:json_annotation/json_annotation.dart';

part 'model_blog.g.dart';

@JsonSerializable(explicitToJson: true)
class BlogResponse {
  final List<ModelBlog>? results;

  BlogResponse(this.results);

  Map<String, dynamic> toJson() => _$BlogResponseToJson(this);

  factory BlogResponse.fromJson(Map<String, dynamic> json) =>
      _$BlogResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ModelBlog {
  final int id;
  final String title;
  final String subTitle;
  final String photo;
  final String content;
  final String author;
  @JsonKey(name: 'create_at')
  final int createAt;
  final String tag;

  ModelBlog({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.photo,
    required this.content,
    required this.createAt,
    required this.tag,
    required this.author,
  });

  Map<String, dynamic> toJson() => _$ModelBlogToJson(this);

  factory ModelBlog.fromJson(Map<String, dynamic> json) =>
      _$ModelBlogFromJson(json);
}

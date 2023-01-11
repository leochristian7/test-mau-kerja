// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) => BlogResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ModelBlog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogResponseToJson(BlogResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ModelBlog _$ModelBlogFromJson(Map<String, dynamic> json) => ModelBlog(
      id: json['id'] as int,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      photo: json['photo'] as String,
      content: json['content'] as String,
      createAt: json['create_at'] as int,
      tag: json['tag'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$ModelBlogToJson(ModelBlog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'photo': instance.photo,
      'content': instance.content,
      'author': instance.author,
      'create_at': instance.createAt,
      'tag': instance.tag,
    };

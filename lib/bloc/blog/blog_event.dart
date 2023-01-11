part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();
}

class GetBlog extends BlogEvent {
  final String search;

  const GetBlog(this.search);
  @override
  List<Object?> get props => [search];
}

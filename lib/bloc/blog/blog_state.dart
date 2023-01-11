part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  const BlogState();
}

class InitialBlogState extends BlogState {
  @override
  List<Object?> get props => [];
}

class LoadingBlogState extends BlogState {
  @override
  List<Object?> get props => [];
}

class SuccessBlogState extends BlogState {
  final List<ModelBlog> data;

  const SuccessBlogState(this.data);
  @override
  List<Object?> get props => [data];
}

class FailureBlogState extends BlogState {
  final String error;

  const FailureBlogState(this.error);
  @override
  List<Object?> get props => [error];
}

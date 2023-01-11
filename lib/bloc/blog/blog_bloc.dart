import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mau_kerja/model/model_blog.dart';
import 'package:mau_kerja/repository/repository.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  Repository repository = Repository.instance;
  BlogBloc() : super(InitialBlogState()) {
    on<GetBlog>(onGetBlog);
  }

  FutureOr<void> onGetBlog(GetBlog event, Emitter<BlogState> emit) async {
    emit(LoadingBlogState());

    try {
      final response = await repository.getBlogs();

      if (response.isSuccess()) {
        if (event.search.isNotEmpty) {
          emit(SuccessBlogState(response
              .getData()
              .results!
              .where((e) => e.title.toLowerCase().contains(event.search))
              .toList()));
        } else {
          emit(SuccessBlogState(response.getData().results!));
        }
      } else {
        emit(FailureBlogState(response.getErrorMessage()));
      }
    } catch (e) {
      emit(FailureBlogState(e.toString()));
    }
  }

  void getBlog(String search) {
    add(GetBlog(search));
  }
}

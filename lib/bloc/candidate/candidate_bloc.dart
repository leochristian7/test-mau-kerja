import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mau_kerja/model/model_candidate.dart';
import 'package:mau_kerja/repository/repository.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  Repository repository = Repository.instance;
  CandidateBloc() : super(InitialCandidateState()) {
    on<GetCandidate>(onGetCandiidate);
  }

  FutureOr<void> onGetCandiidate(
      GetCandidate event, Emitter<CandidateState> emit) async {
    emit(LoadingCandidateState());

    try {
      final response = await repository.getCandidates();

      if (response.isSuccess()) {
        if (event.search.isNotEmpty) {
          emit(SuccessCandidateState(response
              .getData()
              .results!
              .where((e) => e.name.toLowerCase().contains(event.search))
              .toList()));
        } else {
          emit(SuccessCandidateState(response.getData().results ?? []));
        }
      }
    } catch (e) {
      emit(FailureCandidateState(e.toString()));
    }
  }

  void getCandidate(String search) {
    add(GetCandidate(search));
  }
}

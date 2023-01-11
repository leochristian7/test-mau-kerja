import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mau_kerja/model/model_address.dart';
import 'package:mau_kerja/model/model_candidate.dart';
import 'package:mau_kerja/model/model_email.dart';
import 'package:mau_kerja/repository/repository.dart';

part 'detail_candidate_event.dart';
part 'detail_candidate_state.dart';

class DetailCandidateBloc
    extends Bloc<DetailCandidateEvent, DetailCandidateState> {
  Repository repository = Repository.instance;
  DetailCandidateBloc() : super(InitialDetailCandidateState()) {
    on<GetDetailCandidate>(onGetDetailCandidate);
  }

  FutureOr<void> onGetDetailCandidate(
      GetDetailCandidate event, Emitter<DetailCandidateState> emit) async {
    emit(LoadingDetailCandidateState());

    try {
      ModelAddress? resAddress;
      ModelEmail? resEmail;
      final responseEmial = await repository.getEmails();
      final responseAddress = await repository.getAddress();
      if (responseAddress.isSuccess()) {
        resAddress = responseAddress
            .getData()
            .results
            ?.where((e) => e.id == event.candidate.id)
            .first;
      }

      if (responseEmial.isSuccess()) {
        resEmail = responseEmial
            .getData()
            .results
            ?.where((e) => e.id == event.candidate.id)
            .first;
      }

      emit(SuccessDetailCandidateState(event.candidate, resAddress, resEmail));
    } catch (e) {
      emit(FailureDetailCandidateState(e.toString()));
    }
  }

  void getDetailCandidate(ModelCandidate candidate) {
    add(GetDetailCandidate(candidate));
  }
}

part of 'detail_candidate_bloc.dart';

abstract class DetailCandidateEvent extends Equatable {
  const DetailCandidateEvent();
}

class GetDetailCandidate extends DetailCandidateEvent {
  final ModelCandidate candidate;

  const GetDetailCandidate(this.candidate);
  @override
  List<Object?> get props => [];
}

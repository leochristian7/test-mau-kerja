part of 'candidate_bloc.dart';

abstract class CandidateEvent extends Equatable {
  const CandidateEvent();
}

class GetCandidate extends CandidateEvent {
  final String search;

  const GetCandidate(this.search);
  @override
  List<Object?> get props => [search];
}

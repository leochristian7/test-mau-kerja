part of 'detail_candidate_bloc.dart';

abstract class DetailCandidateState extends Equatable {
  const DetailCandidateState();
}

class InitialDetailCandidateState extends DetailCandidateState {
  @override
  List<Object?> get props => [];
}

class LoadingDetailCandidateState extends DetailCandidateState {
  @override
  List<Object?> get props => [];
}

class SuccessDetailCandidateState extends DetailCandidateState {
  final ModelCandidate candidate;
  final ModelAddress? address;
  final ModelEmail? email;

  const SuccessDetailCandidateState(this.candidate, this.address, this.email);
  @override
  List<Object?> get props => [candidate, email, address];
}

class FailureDetailCandidateState extends DetailCandidateState {
  final String errror;

  const FailureDetailCandidateState(this.errror);
  @override
  List<Object?> get props => [errror];
}

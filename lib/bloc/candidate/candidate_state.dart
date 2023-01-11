part of 'candidate_bloc.dart';

abstract class CandidateState extends Equatable {
  const CandidateState();
}

class InitialCandidateState extends CandidateState {
  @override
  List<Object?> get props => [];
}

class LoadingCandidateState extends CandidateState {
  @override
  List<Object?> get props => [];
}

class FailureCandidateState extends CandidateState {
  final String error;

  const FailureCandidateState(this.error);
  @override
  List<Object?> get props => [error];
}

class SuccessCandidateState extends CandidateState {
  final List<ModelCandidate> data;

  const SuccessCandidateState(this.data);
  @override
  List<Object?> get props => [data];
}

part of 'data_cubit.dart';

abstract class DataState extends Equatable {}

class DataInitial extends DataState {
  @override
  List<Object?> get props => [];
}

class DataLoading extends DataState {
  @override
  List<Object?> get props => [];
}

class DataSuccess extends DataState {
  final List<Result> episodes;

  DataSuccess({required this.episodes});
  @override
  List<Object?> get props => [episodes];
}

class DataError extends DataState {
  final String error;

  DataError(this.error);
  @override
  List<Object?> get props => [error];
}

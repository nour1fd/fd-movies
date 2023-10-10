part of 'viewmovie_cubit.dart';

@immutable
abstract class ViewmovieState {}

class ViewmovieInitial extends ViewmovieState {}
class ViewmovieLoading extends ViewmovieState {}
class ViewmovieSuccess extends ViewmovieState {
  final List<Results> results;

  ViewmovieSuccess(this.results);
}
class ViewmovieError extends ViewmovieState {
  final String error;
  ViewmovieError(this.error);
}

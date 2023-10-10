import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/model/movie/moviemodel.dart';
import 'package:movies/model/movie/movierequest.dart';

part 'viewmovie_state.dart';

class ViewmovieCubit extends Cubit<ViewmovieState> {
  ViewmovieCubit() : super(ViewmovieInitial());
  static ViewmovieCubit get(context) => BlocProvider.of(context);
  void viewMovie ()async
  {
    emit(ViewmovieLoading());
    final results = await MovieRequest.getData();
    emit(ViewmovieSuccess(results!));
    print(results);
    print ("successsss");
  }
}
//   List <Result> ?moviemodel;
//   void viewMovie ()async
//   {
//     emit(ViewmovieLoading());
//     MovieRequest.getData().then((value) {
//       moviemodel=MovieModel.fromJson(value.data).results.toList() ;
//     emit(ViewmovieSuccess(moviemodel!));
//     print(value.data);
//     print ("successsss");
//
//   }).catchError((error) {
//       print(error.toString());
//       emit(ViewmovieError(error.toString()));
//     });
// }}
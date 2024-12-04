import 'package:bloc/bloc.dart';
import 'package:blookly_app/core/models/book_model/book_model.dart';
import 'package:blookly_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewestBooks();

    result.fold((faluire) {
      emit(NewsetBooksFaluire(faluire.errMessage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}

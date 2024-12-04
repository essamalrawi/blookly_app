import 'package:bloc/bloc.dart';
import 'package:blookly_app/core/models/book_model/book_model.dart';
import 'package:blookly_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((faluire) {
      emit(FeaturedBooksFaluire(faluire.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}

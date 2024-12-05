import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blookly_app/core/models/book_model/book_model.dart';
import 'package:blookly_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilartBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold((faluire) {
      emit(SimilarBooksFaluire(faluire.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}

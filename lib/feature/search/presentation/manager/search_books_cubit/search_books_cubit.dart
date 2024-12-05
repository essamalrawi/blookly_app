import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blookly_app/core/models/book_model/book_model.dart';
import 'package:blookly_app/feature/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks(String category) async {
    log(category);
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(category: category);

    result.fold((faluire) {
      emit(SearchBooksFaluire(faluire.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}

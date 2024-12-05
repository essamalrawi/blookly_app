part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> book;

  const SearchBooksSuccess(this.book);
}

final class SearchBooksFaluire extends SearchBooksState {
  final String errorMessage;

  const SearchBooksFaluire(this.errorMessage);
}

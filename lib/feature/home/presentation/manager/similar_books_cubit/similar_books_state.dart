part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFaluire extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksFaluire(this.errorMessage);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> book;

  const SimilarBooksSuccess(this.book);
}

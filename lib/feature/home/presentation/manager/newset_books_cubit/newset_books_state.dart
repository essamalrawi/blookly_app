part of 'newset_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewestBooksState {}

final class NewsetBooksLoading extends NewestBooksState {}

final class NewsetBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewsetBooksSuccess(this.books);
}

final class NewsetBooksFaluire extends NewestBooksState {
  final String errMessage;

  const NewsetBooksFaluire(this.errMessage);
}

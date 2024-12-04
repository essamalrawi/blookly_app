import 'package:blookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:blookly_app/feature/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetails extends StatefulWidget {
  const BooksDetails({super.key, required this.book});
  final BookModel book;
  @override
  State<BooksDetails> createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilartBooks(category: widget.book.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetailsBody()),
    );
  }
}

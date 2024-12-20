import 'package:blookly_app/core/functions/random_rating.dart';
import 'package:blookly_app/core/models/book_model/book_model.dart';
import 'package:blookly_app/core/utils/styles.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/book_rating.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/books_action.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_item.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .20),
            child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? 'Error',
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          Text(
            book.volumeInfo.title ?? 'Error',
            style: Styles.textStyle30,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: .7,
            child: Text(book.volumeInfo.authors?.first ?? 'Error',
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const SizedBox(
            height: 18,
          ),
          BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            rating: RandomRating.randomRating(),
            count: book.volumeInfo.pageCount ?? 0,
          ),
          const SizedBox(
            height: 37,
          ),
          BooksAction(
            book: book,
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('You can also like',
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600,
                )),
          ),
          const SizedBox(
            height: 16,
          ),
          const SimillarBooksListView(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

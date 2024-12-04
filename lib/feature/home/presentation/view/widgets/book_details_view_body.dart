import 'package:blookly_app/core/utils/styles.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/books_action.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_item.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

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
            child: const CustomBookImage(
              imageUrl:
                  'https://i.pinimg.com/736x/ac/bc/76/acbc7691eb0423fbf222558e5d7b829a.jpg',
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          const Text('The Jungle Book', style: Styles.textStyle30),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: .7,
            child: Text('Rudyard Kipling',
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const SizedBox(
            height: 18,
          ),
          // const BookRating(
          //   mainAxisAlignment: MainAxisAlignment.center,
          // ),
          const SizedBox(
            height: 37,
          ),
          const BooksAction(),
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

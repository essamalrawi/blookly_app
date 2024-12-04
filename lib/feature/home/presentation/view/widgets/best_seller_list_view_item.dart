import 'package:blookly_app/constants.dart';
import 'package:blookly_app/core/utils/app_router.dart';
import 'package:blookly_app/core/functions/random_rating.dart';
import 'package:blookly_app/core/utils/styles.dart';
import 'package:blookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/book_rating.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? 'Error'),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${book.volumeInfo.authors![0]} ",
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        mainAxisAlignment: MainAxisAlignment.center,
                        count: book.volumeInfo.pageCount!,
                        rating: RandomRating.randomRating(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

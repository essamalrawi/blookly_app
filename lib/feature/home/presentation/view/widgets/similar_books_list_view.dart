import 'package:blookly_app/constants.dart';
import 'package:blookly_app/core/widgets/custom_error_widget.dart';
import 'package:blookly_app/feature/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimillarBooksListView extends StatelessWidget {
  const SimillarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                itemCount: state.book.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl:
                          state.book[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFaluire) {
          return CustomErrorWidget(error: state.errorMessage);
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: Image.asset(kLoadingImagePath));
        }
      },
    );
  }
}

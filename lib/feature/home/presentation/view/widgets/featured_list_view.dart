import 'package:blookly_app/constants.dart';
import 'package:blookly_app/core/widgets/custom_error_widget.dart';
import 'package:blookly_app/feature/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "Error",
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFaluire) {
          return CustomErrorWidget(
            error: state.errorMessage,
          );
        } else {
          return SizedBox(
            child: Center(child: Image.asset(kLoadingImagePath)),
          );
        }
      },
    );
  }
}

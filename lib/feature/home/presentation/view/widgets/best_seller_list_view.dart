import 'package:blookly_app/constants.dart';
import 'package:blookly_app/core/widgets/custom_error_widget.dart';
import 'package:blookly_app/feature/home/presentation/manager/newset_books/newset_books_cubit.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewsetBooksFaluire) {
          return CustomErrorWidget(error: state.errMessage);
        } else {
          return Center(child: Image.asset(kLoadingImagePath));
        }
      },
    );
  }
}

import 'dart:developer';
import 'package:blookly_app/constants.dart';
import 'package:blookly_app/core/models/book_model/book_model.dart';
import 'package:blookly_app/core/utils/styles.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:blookly_app/feature/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:blookly_app/feature/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          log("Initial State");
          return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      CustomSearchTextField(),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Search Result',
                        style: Styles.textStyle18,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                )
              ]));
        } else if (state is SearchBooksSuccess) {
          log("SearchBooksSuccess");
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: SearchResultListView(
                  book: state.book,
                ),
              )
            ]),
          );
        } else if (state is SearchBooksFaluire) {
          log("SearchBooksFaluire");

          return const Text("OOPs");
        } else {
          return Image.asset(kLoadingImagePath);
        }
      },
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.book});
  final List<BookModel> book;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: book.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: book[index],
          ),
        );
      },
    );
  }
}

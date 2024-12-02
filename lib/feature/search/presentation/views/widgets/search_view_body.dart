import 'package:blookly_app/core/utils/styles.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:blookly_app/feature/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
        SliverToBoxAdapter(
          child: SearchResultListView(),
        )
      ]),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}

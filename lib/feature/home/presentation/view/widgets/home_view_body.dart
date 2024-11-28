import 'package:blookly_app/core/utils/assets.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:blookly_app/feature/home/presentation/view/widgets/custom_list_view.item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        FeaturedListView(),
      ],
    );
  }
}

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: FeaturedListViewItem(),
            );
          }),
    );
  }
}

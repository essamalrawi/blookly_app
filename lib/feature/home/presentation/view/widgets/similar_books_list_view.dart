import 'package:blookly_app/feature/home/presentation/view/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimillarBooksListView extends StatelessWidget {
  const SimillarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                imageUrl:
                    'https://i.pinimg.com/736x/ac/bc/76/acbc7691eb0423fbf222558e5d7b829a.jpg',
              ),
            );
          }),
    );
  }
}

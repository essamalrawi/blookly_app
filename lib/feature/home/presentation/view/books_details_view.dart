import 'package:blookly_app/feature/home/presentation/view/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BooksDetails extends StatelessWidget {
  const BooksDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetailsBody()),
    );
  }
}

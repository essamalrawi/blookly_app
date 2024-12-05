import 'package:blookly_app/feature/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: (value) async {
          BlocProvider.of<SearchBooksCubit>(context)
              .searchRepo
              .fetchSearchBooks(category: value);
        },
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: Opacity(
              opacity: .8,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 22,
                    color: Colors.white,
                  )),
            )));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white));
  }
}

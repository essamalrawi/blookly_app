import 'package:blookly_app/core/models/book_model/book_model.dart';
import 'package:blookly_app/core/utils/service_locator.dart';
import 'package:blookly_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:blookly_app/feature/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:blookly_app/feature/home/presentation/view/books_details_view.dart';
import 'package:blookly_app/feature/home/presentation/view/home_view.dart';
import 'package:blookly_app/feature/search/presentation/views/search_view.dart';
import 'package:blookly_app/feature/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BooksDetails(
              book: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}

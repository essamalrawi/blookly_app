import 'package:blookly_app/core/errors/failures.dart';
import 'package:blookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:blookly_app/feature/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}

import 'package:dartz/dartz.dart';
import 'package:warsha/core/errors/failure.dart';

abstract class MenuRepo {
  Future<Either<Failure,String>> logOut();
}
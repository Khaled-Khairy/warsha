import 'package:dartz/dartz.dart';
import 'package:warsha/core/errors/failure.dart';
import 'package:warsha/features/menu/data/models/change_password/change_password_request.dart';
import 'package:warsha/features/menu/data/models/change_password/change_password_response.dart';
import 'package:warsha/features/menu/data/models/profile.dart';

abstract class MenuRepo {
  Future<Either<Failure,String>> logOut();
  Future<Either<Failure,Profile>> getProfile();
  Future<Either<Failure, ChangePasswordResponse>> changePassword({required ChangePasswordRequest changePasswordRequest});
}
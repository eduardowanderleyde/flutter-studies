// user_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:initial_code/src/modules/login/domain/entities/user.dart';
import '../erros/erros.dart';

abstract class IUserRepository {
  Future<Either<IUserErrors,bool>> login(User user);
}


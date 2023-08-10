import 'package:fpdart/fpdart.dart';
import 'package:initial_code/src/modules/login/domain/erros/erros.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

abstract class IAuthenticationUseCase {
  Future<Either<IUserErrors,bool>> login(String username, String password);
  // Outros casos de uso de autenticação
}

class AuthenticationUse implements IAuthenticationUseCase {
  final IUserRepository repository;

  AuthenticationUse(this.repository);
  //AuthenticationUseCaseImpl({required this.repository});

  @override
  Future<Either<IUserErrors,bool>> login(String username, String password) async {
    if (username.isEmpty && password.isEmpty) {
      return left(UserError(message: 'Usuário e senha não podem ser vazios.'));
    } 
    final user= User(username: username, password: password);
    return await repository.login(user);
  }
}
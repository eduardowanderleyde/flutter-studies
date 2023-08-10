abstract class IUserErrors{}

class UserError implements IUserErrors{
  final String message;
  UserError({required this.message});
}
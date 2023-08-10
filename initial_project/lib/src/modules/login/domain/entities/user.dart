class User {
  final String username;
  final String password; // Note: Em uma aplicação real, você não deve armazenar senhas em texto puro, é melhor usar hashes.

  User({
    required this.username,
    required this.password,
  });
}

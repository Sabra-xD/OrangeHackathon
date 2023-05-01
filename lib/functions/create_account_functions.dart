//A function that validate user entered password

bool validatePassword(String pass) {
  RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  String password = pass.trim();
  if (passValid.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

bool isEmailValid(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

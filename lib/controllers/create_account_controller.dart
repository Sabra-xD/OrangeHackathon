//A function that validate user entered password

bool validatePassword(String pass) {
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  String _password = pass.trim();
  if (pass_valid.hasMatch(_password)) {
    return true;
  } else {
    return false;
  }
}

bool isEmailValid(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

// bool validateEmail(String emai) {}

/// This function checks if the given input is infact all numbers and starts with '01' is 11 digits.
/// ToDo: Add to this Function to see if the given number is already in use with the backend. Return such error.
///
///
bool hasRequiredNumberOfDigits(String input, int requiredDigits) {
  String digitRegex = r'\d'; // regular expression for a single digit
  int digitCount = RegExp(digitRegex)
      .allMatches(input)
      .length; // count the number of digits in the input

  if (double.tryParse(input) != null) {
    if (input.startsWith("01")) {
      return digitCount == requiredDigits;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

///
///
///
///
///
///

bool confirmPassword(String pass, String givenPass) {
  if (pass == givenPass) {
    return true;
  } else {
    return false;
  }
}

import 'package:flutter/material.dart';

import 'email_validator.dart';

abstract class Validators {
  Validators._();

  static FormFieldValidator<String>? getValidator(TextInputType? keyboardType) {
    return switch (keyboardType) {
      TextInputType.emailAddress => Validators.email,
      TextInputType.number => Validators.number,
      _ => null,
    };
  }

  static String? required(String? input) {
    if (input?.trim().isEmpty ?? true) {
      return 'Required';
    }

    return null;
  }

  static String? requiredTyped<T>(T? input) {
    if (input == null) {
      return 'Required';
    }

    return null;
  }

  static String? email(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    if (!EmailValidator.validate(email)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    // if (password.length < 6) {
    //   return 'Password must be at least 6 characters long';
    // }

    // if (!password.contains(RegExp('[A-Z]'))) {
    //   return 'Password must contain at least one capital letter';
    // }

    return null;
  }

  /// Form validation for confirm password field.
  static String? confirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Password is required';
    } else if (confirmPassword != password) {
      return 'Password must be same';
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value!.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }

  static String? number(String? input) {
    if (input == null) {
      return 'Required';
    }

    final number = num.tryParse(input);
    if (number == null) {
      return 'Enter a valid number';
    }

    return null;
  }

  static String? positiveInteger(String? input) {
    if (input == null) {
      return 'Required';
    }

    final integer = int.tryParse(input);
    if (integer == null || integer <= 0) {
      return 'Enter positive integer';
    }

    return null;
  }

  static String? validatePasswordMatch(String? value, String? pass2) {
    if (pass2!.isEmpty) {
      return "Please re enter your password";
    }
    if (value != pass2) {
      return "Password does not match";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    }
    // if (value.length < 6) {
    //   return "Password limit";
    // }
    // if (!RegExp(r"^(?=.*?[0-9])").hasMatch(value)) {
    //   return "Password should include 1 number";
    // }
    // if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value.trim())) {
    //   return "Password should 1 special character";
    // }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email address";
    }
    if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
            r"*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value.trim())) {
      return "Enter valid email";
    }
    return null;
  }
}

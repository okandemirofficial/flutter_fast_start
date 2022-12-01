///Common regex validators for forms
extension RegexValidators on String {
  ///is mail contains @ and domain after this
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  ///is password match the requiretements below
  bool isValidPassword() {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(this);
    //   r'^
    //   (?=.*[A-Z])       // should contain at least one upper case
    //   (?=.*[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])      // should contain at least one digit
    //   (?=.*?[!@#\$&*~]) // should contain at least one Special character (REMOVED)
    //   .{8,}             // Must be at least 8 characters in length
    // $
  }
}

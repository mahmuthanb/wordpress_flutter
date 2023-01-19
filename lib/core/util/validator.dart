class Validator {
  static String? url(String? str) {
    if (str == null || str.isEmpty) {
      return "- Please enter domain";
    } else {
      return RegExp(
                  r"[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)")
              .hasMatch(str)
          ? null
          : "- Please enter a valid domain";
    }
  }
}

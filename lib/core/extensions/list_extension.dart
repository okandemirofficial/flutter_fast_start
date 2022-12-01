///It helps produces string
extension CommaSeparated on List<dynamic> {
  ///Produces comma separated string
  String commaSeparatedString() {
    return join(', ');
  }

  ///Produces line separated string
  String lineSeparatedString() {
    return join('\n');
  }
}

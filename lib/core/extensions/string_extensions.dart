extension StringExtension on String {
  String toAbbreviation() {
    List<String> words = split(' ');
    if (words.length == 1) {
      if (length == 1) {
        return toUpperCase();
      }
      return substring(0, 2).toUpperCase();
    }
    if (words.length > 1) {
      return words[0][0].toUpperCase() +
          words[words.length - 1][0].toUpperCase();
    }
    return split(' ').map((e) => e[0]).join().toUpperCase();
  }

  String getExtension() {
    return split('.').last;
  }
}

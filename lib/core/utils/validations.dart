bool isValidLink(String link) {
  String pattern = r'[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  RegExp regExp = RegExp(pattern);
  if (link.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(link)) {
    return false;
  }
  return true;
}

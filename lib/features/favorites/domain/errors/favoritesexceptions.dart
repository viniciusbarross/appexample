abstract class ExceptionsFavorites implements Exception {}

class ExceptionAddFavorite implements ExceptionsFavorites {
  String? message;

  ExceptionAddFavorite({this.message});

  @override
  String toString() => 'ExceptionAddFavorite(message: $message)';
}

class ExceptionInvalidLinkAddFavorite extends ExceptionAddFavorite {
  ExceptionInvalidLinkAddFavorite() {
    super.message = 'Link inserted is invalid';
  }
}

class ExceptionLinkCannotBeEmptyAddFavorite extends ExceptionAddFavorite {
  ExceptionLinkCannotBeEmptyAddFavorite() {
    super.message = 'Link inserted cannot be empty';
  }
}

class ExceptionGetFavorite implements ExceptionsFavorites {
  String? message;

  ExceptionGetFavorite({this.message});

  @override
  String toString() => 'ExceptionGetFavorites(message: $message)';
}

class ExceptionInvalidLinkGetFavorite extends ExceptionGetFavorite {
  ExceptionInvalidLinkGetFavorite() {
    super.message = 'Link inserted is invalid';
  }
}

class ExceptionLinkCannotBeEmptyGetFavorite extends ExceptionGetFavorite {
  ExceptionLinkCannotBeEmptyGetFavorite() {
    super.message = 'Link inserted cannot be empty';
  }
}

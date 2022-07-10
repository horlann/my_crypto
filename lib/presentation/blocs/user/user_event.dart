abstract class UserEvent {}

class InitEvent extends UserEvent {}

class AddToFavoriteEvent extends UserEvent {
  final String slug;

  AddToFavoriteEvent(this.slug);
}

part of 'shoppinng_bloc.dart';

@immutable
sealed class ShoppinngEvent {}
class loadShopping extends ShoppinngEvent{}

class AddShoppingItem extends ShoppinngEvent{
  final String name;
  AddShoppingItem(this.name);
}
class DeletShoppingItem extends ShoppinngEvent{
  final String id;
  DeletShoppingItem(this.id);
}
class ToggleShopping extends ShoppinngEvent{
  final int index;
  ToggleShopping(this.index);
}
part of 'shoppinng_bloc.dart';

@immutable
sealed class ShoppinngState {}

final class ShoppinngInitial extends ShoppinngState {}



final class Shoppinngloaded extends ShoppinngState{
  final List<ShoppingItem> items;
  Shoppinngloaded(this.items);

}
final class  ShoppinngEmpty extends ShoppinngState{

}


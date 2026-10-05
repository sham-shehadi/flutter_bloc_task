import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_task/model/shopping_item.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart' as uuid_package;
part 'shoppinng_event.dart';
part 'shoppinng_state.dart';

class ShoppinngBloc extends Bloc<ShoppinngEvent, ShoppinngState> {
  List<ShoppingItem> itemsS=[];
 // final Uuid _uuid=const Uuid();
  final uuid_package.Uuid _uuidd=uuid_package.Uuid();
  ShoppinngBloc() : super(ShoppinngInitial()) {

    on<loadShopping>(_onloadShopping);
        on<AddShoppingItem>(_onAddShoppingItem);
    on<DeletShoppingItem>(_onDeletShoppingItem);
on<ToggleShopping>(_onToggleShopping);
  }
  void _onloadShopping(loadShopping event,Emitter<ShoppinngState> emit){
    itemsS=[
      ShoppingItem( id: _uuidd.v4(), name: 'حليب'),
      ShoppingItem(id:_uuidd.v4() , name: 'حليب'),  ShoppingItem(id:_uuidd.v4() , name: 'حليب')
    ];
    emit(Shoppinngloaded(List.from(itemsS)));
  }
  void _onAddShoppingItem(AddShoppingItem event,Emitter<ShoppinngState> emit){
    final newItem =ShoppingItem(id: _uuidd.v4(), name: event.name);
    itemsS.insert(0, newItem);
    emit(Shoppinngloaded(List.from(itemsS)));
  }
  void _onDeletShoppingItem (DeletShoppingItem event, Emitter <ShoppinngState>emet){
    itemsS.removeWhere((item) => item.id==event.id,);
    if(itemsS.isEmpty){
      emet(ShoppinngEmpty());
    }else{
      emit(Shoppinngloaded(List.from(itemsS)));

    }
  }
  void _onToggleShopping(ToggleShopping event,Emitter<ShoppinngState> emet){
    final idItem = itemsS[event.index];

    itemsS[event.index] = ShoppingItem(
      id: idItem.id, name: idItem.name,
      isBought: !idItem.isBought,
    );

    emit(Shoppinngloaded(List.from(itemsS)));

  }


}

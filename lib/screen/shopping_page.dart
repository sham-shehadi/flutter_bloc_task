import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task/bloc/shoppinng_bloc.dart';
import 'package:flutter_bloc_task/widget/item_card.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
@override
void initState() {
 super.initState();
context.read<ShoppinngBloc>().add(loadShopping());
}
@override
Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xFFFAFBFC),

 appBar: AppBar(
 backgroundColor: Color(0xFFBFE3F7), centerTitle: true, actions:  [
Padding(
   padding: EdgeInsets.only(right: 16), child: Icon(Icons.shopping_bag_outlined, color: Color(0xFF24536B), size: 30,),),],
title: Text('قائمة مشترياتي', style: TextStyle(color: Color(0xFF24536B), fontSize: 24, fontWeight: FontWeight.bold,
),),),

   body: BlocBuilder<ShoppinngBloc, ShoppinngState>(
    builder: (context, state) {
    if (state is ShoppinngInitial) {
             return Center(child: CircularProgressIndicator(),);
   }

    if (state is ShoppinngEmpty) {return  Center(
        child: Text('قائمة التسوق فارغة حاليًا\nأضف بعض المنتجات', textAlign: TextAlign.center, style: TextStyle(
color: Color(0xFF24536B),fontSize: 20, fontWeight: FontWeight.w600,
),),);}



    if (state is Shoppinngloaded) {return ListView.builder(padding: EdgeInsets.all(20),
itemCount: state.items.length, itemBuilder: (context, index) {
      final item = state.items[index];

     return Padding(
     padding: const EdgeInsets.only(bottom: 15),
  child: Dismissible(
    key: ValueKey(item.id), direction: DismissDirection.endToStart,
    onDismissed: (direction) {context.read<ShoppinngBloc>().add(DeletShoppingItem(item.id));
},

     background: Container(padding: EdgeInsets.only(right: 25), alignment: Alignment.centerRight,
          decoration: BoxDecoration(color: Colors.red,
             borderRadius: BorderRadius.circular(20),),
child:  Icon(Icons.delete, color: Colors.white,size: 30,),),

child: ItemCard(titel: item.name ,
       isBought: item.isBought, itemIcon: Icons.shopping_cart_outlined,
  onchanged: (value) {
    context.read<ShoppinngBloc>().add(ToggleShopping(index))
;},
),),);
},
);}

return const SizedBox.shrink();
},
),

floatingActionButton: FloatingActionButton(backgroundColor: const Color(0xFF24536B), foregroundColor: Colors.white,

  child: const Icon(Icons.add, size: 30),
onPressed: () {
final nameController = TextEditingController();


    showDialog(
  context: context,
  builder: (dialogContext) {
    return AlertDialog(
      title:  Text('إضافة غرض جديد'), content: TextField(controller: nameController, decoration: const InputDecoration(
          labelText: 'اسم الغرض', border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {Navigator.pop(dialogContext);
          },
          child:Text('إلغاء'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF24536B),
            foregroundColor: Colors.white,
          ),
          onPressed: () {


            if (nameController.text.trim().isNotEmpty) {
              context.read<ShoppinngBloc>().add(AddShoppingItem(nameController.text.trim()));
              Navigator.pop(dialogContext);}
          },
          child: Text('إضافة'),
        ),
      ],
    );
  },
);
},
),
);
}
}
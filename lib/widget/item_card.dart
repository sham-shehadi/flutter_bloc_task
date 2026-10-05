import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget{
  final String titel;
  final bool isBought;
  final IconData itemIcon;
  final ValueChanged<bool?> onchanged;
  const ItemCard({super.key,required this.titel,this.isBought=false,required this.itemIcon,required this.onchanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

      ),
      padding: EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(value: isBought, onChanged: onchanged,activeColor: Color(0xFF24536B),),
          Text(
            titel,
            style:  TextStyle(
              color: isBought ? Colors.grey : const Color(0xFF24536B),


              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            itemIcon,
            color: Color(0xFF24536B),
            size: 38,
          ),
        ],
      ),
    );
  }

}
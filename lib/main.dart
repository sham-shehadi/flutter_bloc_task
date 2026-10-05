import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/bloc/shoppinng_bloc.dart';
import 'screen/shopping_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => ShoppinngBloc(),
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home: ShoppingPage(),
      ),
    );
  }
}

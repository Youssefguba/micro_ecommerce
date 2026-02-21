import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_ecommerce/cubits/category_products_cubit.dart';

import 'home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/product_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CategoryProductsCubit())],
      child: MaterialApp(home: RegisterScreen()),
    );
  }
}

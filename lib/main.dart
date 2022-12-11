import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/screens/home_page.dart';

import 'business/cubit/news_cubit.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
          ..getTopHead()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
       home: HomeScreen(),
      ),
    );
  }
}

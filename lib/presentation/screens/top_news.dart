import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/business/cubit/news_cubit.dart';
import 'package:news/presentation/widgets/article.dart';
class TopHeadScreen  extends StatelessWidget {
  const TopHeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).topHead;
        return articleBuilder(list, context);
      },
    );
  }
}
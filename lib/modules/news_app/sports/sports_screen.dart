import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/layout/news_app/cubit/cubit.dart';
import 'package:first_project/layout/news_app/cubit/states.dart';
import 'package:first_project/shared/components/components2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print ('hello ');

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).sports;

        return articleBuilder(context, list);
      },
    );
  }
}

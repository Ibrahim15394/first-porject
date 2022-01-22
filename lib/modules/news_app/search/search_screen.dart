import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/layout/news_app/cubit/cubit.dart';
import 'package:first_project/layout/news_app/cubit/states.dart';
import 'package:first_project/shared/components/components2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

 var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var list = NewsCubit.get(context).search;

        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'search must not is empty';
                    }
                    return null;
                  },
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  label:'search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                  child: articleBuilder(context, list,isSearch :true)
              ),
            ],
          ),
        );
      },

    );
  }
}

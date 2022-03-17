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
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'search must not is empty';
                    }
                    return null;
                  },
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: const InputDecoration(
                   label: Text('search'),
                    prefixIcon: Icon(Icons.search_outlined),
                  ),
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

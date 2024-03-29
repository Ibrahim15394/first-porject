
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/layout/news_app/cubit/cubit.dart';
import 'package:first_project/modules/news_app/web_view/web_view_screen.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   Function? onSubmit,
   Function? onChange,
  required Function validate,
   IconData? prefix,
   IconData? suffix,
  required String label,
}) =>   TextFormField(
   controller: controller,
   keyboardType: type,
   onFieldSubmitted: (value)
   {
     onSubmit;
   },
   onChanged: (value)
   {
     onChange;
   },
  validator: (value)
  {
    validate;
  },
  decoration: InputDecoration(
  prefixIcon: Icon(prefix,),
  suffixIcon: Icon(suffix,),
  labelText: label,
  border: const OutlineInputBorder(),
 ),
 );


Widget buildTaskItem(Map model , context) => Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding:const EdgeInsets.all(20.0),
      child:  Row(
        children:
        [
          CircleAvatar(
            radius: 40.0,
            child: Text(
              '${model['time']}',
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  '${model['title']}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          IconButton(
              onPressed: ()
              {
                AppCubit.get(context).updateData(
                    status: 'done',
                    id: model['id']
                );
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              )
          ),
          IconButton(
              onPressed: ()
              {
                AppCubit.get(context).updateData(
                    status: 'archive',
                    id: model['id']
                );
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.black45,
              )
          ),



        ],
      ),
    ),
   onDismissed: (direction)
   {
     AppCubit.get(context).deleteData(id: model['id']);
   },
);

Widget tasksBuilder({required List<Map> tasks,}) => ConditionalBuilder(
  condition: tasks.isNotEmpty,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index) => buildTaskItem(tasks [index],context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.menu,
          color: Colors.grey,
          size: 50.0,
        ),
        Text(
          'No Task yet , Please Add Some Tasks',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider() =>  Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[200],


  ),
);

Widget buildArticleItem({article, context}) => InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image:  DecorationImage(
              image: NetworkImage(
              '${article['urlToImage']}',
               // "https://cdni.rt.com/media/pics/2021.12/original/61cc03de423604485e50fd05.JPG",


              ),
              fit: BoxFit.cover,
          ),
        ),
        ),
       const SizedBox(width: 15.0,),
          Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Expanded(
                  child: Text(
                 ' ${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',

                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,

                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
) ;

void navigateTo(context, widget) =>  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>  widget,
    ),
);

Widget articleBuilder(context, list,{isSearch = false}) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) =>ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(context: context, article: list[index]),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,
  ),
  fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),

);
void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget),
            (route) => false);
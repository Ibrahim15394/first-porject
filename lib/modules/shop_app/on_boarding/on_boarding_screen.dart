// ignore_for_file: unnecessary_string_interpolations

import 'package:first_project/modules/shop_app/login/shop_login_screen.dart';
import 'package:first_project/shared/components/components2.dart';
import 'package:first_project/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
});
}
 var boardController = PageController();
 bool isLast = false;

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding =
  [
    BoardingModel(
      image:'assets/images/on bording.jpg',
      title: 'on Board 1 Title',
      body: 'on Board 1 body',
    ),
    BoardingModel(
    image:'assets/images/on bording.jpg',
    title: 'on Board 2 Title',
    body: 'on Board 2 body',
  ),
    BoardingModel(
      image:'assets/images/on bording.jpg',
      title: 'on Board 3 Title',
      body: 'on Board 3 body',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: ()
          {
            navigateAndFinish(context, const ShopLoginScreen(),);
          },
          child: const Text('SKIP'),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index)
                {
                  if(index == boarding.length - 1)
                  {
                    print('last');
                    setState(() {
                      isLast = true;
                    });
                  }else
                    {
                      setState(() {
                        isLast = false;
                      });
                    }
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: defaultColor,
                     dotColor:Colors.grey ,
                      dotHeight:10.0 ,
                      dotWidth:10.0 ,
                      spacing:5.0 ,
                      expansionFactor:4 ,
                    ),
                    count: boarding.length
                ),
                const Spacer(),
                FloatingActionButton(
                    onPressed: ()
                    {
                      if(isLast)
                        {
                          navigateAndFinish(context, const ShopLoginScreen(),);
                        }else
                          {
                            boardController.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                    },
                  child: const Icon(Icons.arrow_forward_ios),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage('${model.image}'),
        ),
      ),
      const SizedBox(
        height: 45,
      ),
      Text(
        '${model.title}',
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 35,
      ),
      Text(
        '${model.body}',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

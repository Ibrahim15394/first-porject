import 'package:first_project/modules/counter/cubit/cubit.dart';
import 'package:first_project/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
 final int counter = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
      child:BlocConsumer< CounterCubit, CounterStates >(
          listener: (context, state)
          {
            if(state is CounterMinusState)
              {
                print('minus state${state.counter}');
              }
            if(state is CounterPlusState)
            {
              print('plus state ${state.counter}');
            }
          },
          builder: (context, state)
          {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Counter',
                ),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: ()
                    {
                      CounterCubit.get(context).minus();
                    },
                      child: const Text(
                        'Minus',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0
                      ),
                      child: Text(
                        '${CounterCubit. get(context).counter}',
                        style: const TextStyle(
                          fontSize:50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(onPressed: ()
                    {
                      CounterCubit.get(context).plus();
                    },
                      child: const Text(
                        'Plus',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
      ) ,
    );
  }
}




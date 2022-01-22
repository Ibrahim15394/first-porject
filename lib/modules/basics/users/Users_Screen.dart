import 'package:first_project/models/users/users.dart';
import 'package:flutter/material.dart';


class UsersScreen extends StatefulWidget {

  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List< UserModel > users = [
    UserModel(
       id: 1,
       name: 'ibrahim',
       phone: '01099988617',
   ),
    UserModel(
      id: 2,
      name: 'mostafa',
      phone: '01094533617',
    ),
    UserModel(
      id: 3,
      name: 'tahar',
      phone: '010993322617',
    ),
    UserModel(
      id: 4,
      name: 'ali',
      phone: '01034588617',
    ),
    UserModel(
      id: 1,
      name: 'ibrahim',
      phone: '01099988617',
    ),
    UserModel(
      id: 2,
      name: 'mostafa',
      phone: '01094533617',
    ),
    UserModel(
      id: 3,
      name: 'tahar',
      phone: '010993322617',
    ),
    UserModel(
      id: 4,
      name: 'ali',
      phone: '01034588617',
    ),
    UserModel(
      id: 1,
      name: 'ibrahim',
      phone: '01099988617',
    ),
    UserModel(
      id: 2,
      name: 'mostafa',
      phone: '01094533617',
    ),
    UserModel(
      id: 3,
      name: 'tahar',
      phone: '010993322617',
    ),
    UserModel(
      id: 4,
      name: 'ali',
      phone: '01034588617',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Users'
        ),
      ),
      body:ListView.separated(
          itemBuilder:(context, index) =>buildUsersItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 35.0
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      ),
    );
  }

  Widget buildUsersItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(
            '${user.id}',
            style: const TextStyle(
              fontSize: 40.0,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
           ' ${user.name}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
             ' ${user.phone}',
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

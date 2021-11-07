import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 var emailController= TextEditingController();

 var passwordController= TextEditingController();
 var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
            key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: 20.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType:TextInputType.emailAddress,
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    onChanged: (value){
                      print(value);
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'email address must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon:Icon(Icons.email_sharp),
                      labelText: "Email Address",
                      border: OutlineInputBorder(),
                    ),

                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType:TextInputType.phone,
                    obscureText: true,
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    onChanged: (value){
                      print(value);
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                        {
                          return 'password must not be empty';
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon:Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),

                  ),
                  SizedBox(
                height: 20.0,
                ),
                  defaultButton(
                    text: 'login',
                    background: Colors.blue,
                    width: double.infinity,
                    function:()
                    {

                      if(formKey.currentState!.validate())
                     {
                       print(emailController.text);
                       print(passwordController.text);
                     }
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don\'t have an account?"
                      ),
                      TextButton(onPressed: (){},
                          child:Text("Register Now"),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

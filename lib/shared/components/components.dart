import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final double width;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final Function function;

  const DefaultButton(
      this.text, {Key? key,
    this.width = double.infinity,
    this.background = Colors.grey,
    this.isUpperCase = true,
    this.radius = 0.0,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {



 final TextEditingController controller;
 final TextInputType type;
 final Function onSubmit;
 final Function onChanged;
 final Function validate;
 final IconData prefix;
 final IconData suffix;
 final String label;

  const DefaultFormField(
      this.controller,
      this.type,
      this.onSubmit,
      this.onChanged,
      this.validate,
      this.prefix,
      this.suffix,
      this.label, {Key? key}
      ) : super(key: key) ;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: true,
      onFieldSubmitted: (test){

        onSubmit();
      } ,
      validator: (value) {
         validate;
      },
      decoration:  InputDecoration(
        prefixIcon:Icon(prefix) ,
        suffixIcon: Icon(suffix),
        labelText: "label",
        border: const OutlineInputBorder(),

      ),
    );
  }
}


import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key,
  required this.onchanged,
  this.labeltext,
  this.ontap,
  this.readonly=false,
  this.hinttext,
  required this.validate,
  this.keyboardType
  });

  final void Function(String)? onchanged;
  final String? labeltext;
  final String? hinttext;
  final void Function()? ontap;
  final bool readonly;  
  final bool validate;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        readOnly: widget.readonly,
        validator: (value) {
          if(widget.validate==true){
          if(value!.isEmpty){
            return "Can't be empty ";
          }
          else{
            return null;
          }}
          else{
            return null;
          }
        },
        onChanged: widget.onchanged,
        onTap: widget.ontap,
        decoration: InputDecoration(
          
          hintText: widget.hinttext,
          focusColor: Colors.red,
          labelText: widget.labeltext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
      ),
    );
  }
}
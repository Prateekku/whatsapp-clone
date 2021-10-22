import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';
class Button extends StatelessWidget {
  const Button({ Key? key,required this.name,required this.icon}): super(key: key);
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal[300],
        radius: 22,
        child: Icon(icon,size: 24, color: Colors.white,),

      ),
      title: Text(name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    );
  }
}

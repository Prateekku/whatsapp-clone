import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';
import 'package:whatsapp_clone/screen/Individual.dart';

class CustomCard extends StatelessWidget {
  final Chatmodel chatmodel;

  const CustomCard({Key? key, required this.chatmodel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context)=> Individual(chatmodel: chatmodel,),),);
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset(chatmodel.isGroup? "assets/gp.svg" : "assets/per.svg", color: Colors.white,height: 38.0,
              width: 38.0,),
              radius: 25,
              backgroundColor: Colors.teal[500],
            ),
            title: Text(chatmodel.name,style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.bold),),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 4.0),
                Text(chatmodel.currentMessage, style: TextStyle(fontSize: 13),)
              ],
            )
            ,
            trailing: Text(chatmodel.time),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 80.0),
            child: Divider(thickness: 1.0, ),
          )
        ],
      ),
    );
  }
}

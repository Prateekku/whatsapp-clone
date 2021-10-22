import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';
class Contactcard extends StatelessWidget {
  const Contactcard({ Key? key,required this.contact}): super(key: key);
  final Chatmodel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal[200],
                      radius: 22,
              child: SvgPicture.asset("assets/per.svg",color: Colors.white,),

            ),
           contact.select? Positioned(
              bottom: 3,
              right: 4,
              child: CircleAvatar
                ( backgroundColor: Colors.teal,
                  radius: 11,
                  child: Icon(Icons.check,color: Colors.white,size: 18,)
              ),
            ):Container(),
          ],
        ),
      ),
      title: Text(contact.name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      subtitle: Text(contact.Status,
      style: TextStyle(fontSize: 14,fontWeight:FontWeight.normal),),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';
class Avatar extends StatelessWidget {

  final Chatmodel contact;

  const Avatar({Key? key, required this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.teal[200],
                radius: 22,
                child: SvgPicture.asset("assets/per.svg",color: Colors.white,),

              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar
                  ( backgroundColor: Colors.teal,
                    radius: 11,
                    child: Icon(Icons.clear,color: Colors.white,size: 13,)
                ),
              ),
            ],
          ),
          Text(contact.name),
        ],
      ),
    );
  }
}

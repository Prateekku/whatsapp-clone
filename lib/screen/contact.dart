import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';
import 'package:whatsapp_clone/CustomUi/Button.dart';
import 'package:whatsapp_clone/CustomUi/Contactcard.dart';
import 'package:whatsapp_clone/CustomUi/CustomCard.dart';
import 'package:whatsapp_clone/screen/CreateGroup.dart';
class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);
  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  List<Chatmodel> chats =[
      Chatmodel(
        name: "Deep",
        Status: "using whatsapp",
          isGroup: false,
          currentMessage: " ",
          time: "2:30",
          icon: " ",
          select: false
      ),
  ];
  @override
  Widget build(BuildContext context) {
    List<Chatmodel> contacts = [
      Chatmodel(name:"Deep",
      Status: "using whatsapp",
          isGroup: false,
          currentMessage: " ",
          time: "2:30",
          icon: " ",
           select: false),
      Chatmodel(name:"ravi friends",
          Status: "using whatsapp",
          isGroup: true,
          currentMessage: " ",
          time: " ",
          icon: " ",
          select: false),
      Chatmodel(name:"das",
          Status: "using whatsapp",
          isGroup: false,
          currentMessage: " ",
          time: " ",
          icon: " ",
          select: false)
    ];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact",style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold
            ),),
            Text("100 contact",style: TextStyle(
              fontSize: 13,
            fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 26,)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(child: Text("Invite a friend"), value: "Invite a friend"),
                  const PopupMenuItem(child: Text("Contacts"), value: "Contacts"),
                  const PopupMenuItem(child: Text("Refresh"), value: "Refresh"),
                  const PopupMenuItem(child: Text("Help"), value:"Help",),

                ];
              }
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length+2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell
                (
                  onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=> CreateGroup()),);
              },
                  child: Button(icon: Icons.group,name:"New Group",));
            }else if(index == 1)
            {
             return Button(icon: Icons.person_add,name:"New contact");
            }
            return Contactcard(contact: contacts[index-2]);
          }

      )
    );
  }
}

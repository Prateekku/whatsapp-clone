import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';
import 'package:whatsapp_clone/CustomUi/CustomCard.dart';
import 'package:whatsapp_clone/screen/contact.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chatmodel> chats = [
    Chatmodel(name: "Deep",
               isGroup: false,
                 currentMessage: "hi whatsup",
                 time: "2:30",
                icon: "per.svg",
                Status: "i am using whatsapp",
                 select: false),
    Chatmodel(name: "Das",
        isGroup: false,
        currentMessage: "hi !!!!",
        time: "2:30",
        icon: "per.svg",
        Status: "i am using whatsapp",
        select: false),
    Chatmodel(name: "mmmutians",
        isGroup: true,
        currentMessage: "hello",
        time: "2:30",
        icon: "gp.svg",
    Status: "i am using whatsapp",
        select: false),
    Chatmodel(name: "ravi friends",
        isGroup: true,
        currentMessage: "hi ravi",
        time: "2:30",
        icon: "gp.svg",
        Status: "i am using whatsapp",
        select: false),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> contact(),),);
        },
          child: Icon(Icons.chat),

      ),
     body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatmodel: chats[index])
        )
    );

  }
}


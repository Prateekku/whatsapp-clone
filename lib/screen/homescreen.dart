import 'package:flutter/material.dart';
import 'package:whatsapp_clone/page/Camera.dart';
import 'package:whatsapp_clone/page/chat.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);


  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TabController _controller = TabController(length: 4, vsync: this,initialIndex: 1);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: const Text('Whatsapp Clone',),
        actions: [IconButton(icon: const Icon(Icons.search),onPressed: ()
                       {}),
                  PopupMenuButton<String>( onSelected: (value)
                      {
                           print(value);
                      },
                      itemBuilder: (BuildContext context)
                  {
                   return  [
                     const PopupMenuItem(child: Text("New Group"), value:"New Group"),
                     const PopupMenuItem(child: Text("New Broadcast"), value: "New Broadcast"),
                     const PopupMenuItem(child: Text("Linked devices"), value: "Linked Devices"),
                     const PopupMenuItem(child: Text("Starred messages"),value: "Starred messages",),
                     const PopupMenuItem(child: Text("Payments"), value: "Payments"),
                     const PopupMenuItem(child: Text("Settings"), value: "Settings"),
                     ];
                  }
                  ),
        ],
        bottom: TabBar(controller: _controller,
           indicatorColor: Colors.white,
           tabs: const [
             Tab(
               icon: Icon(Icons.camera_alt),
             ),
             Tab(
               text: "CHAT"),
             Tab(
               text: "STATUS",
             ),
             Tab(
               text: "CALL",
             )
           ],),

      ),
      body: TabBarView(
        controller: _controller,
         children: [
           Camera(),
           ChatPage(),
           Text("status"),
           Text("call"),
         ],

      ),

    );
  }
}

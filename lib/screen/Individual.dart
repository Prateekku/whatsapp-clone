//import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';

class Individual extends StatefulWidget {
  const Individual({Key? key, required this.chatmodel}) : super(key: key);
  final Chatmodel chatmodel;
  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(backgroundColor: Colors.teal,
          leadingWidth: 72,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                CircleAvatar(
                  child: SvgPicture.asset(widget.chatmodel.isGroup
                      ? "assets/gp.svg"
                      : "assets/per.svg", color: Colors.teal, height: 35.0,
                    width: 35.0,),
                  radius: 22,
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {

            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chatmodel.name, style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  Text("last seen today at 10:00",
                    style: TextStyle(fontSize: 13.0),)
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(child: Text("View contact"), value: "View contact"),
                    const PopupMenuItem(child: Text("Media,Links,and docs"), value: "Media,Links,and docs"),
                    const PopupMenuItem(child: Text("Search"), value: "Search"),
                    const PopupMenuItem(child: Text("Mute notifications"), value: "Mute notifications",),
                    const PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper"),
                    const PopupMenuItem(child: Text("More"), value: "More",),
                  ];
                }
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Card(child: TextFormField
                      (textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintText: "Type a message",
                        prefixIcon: IconButton(icon: Icon(Icons.emoji_emotions),
                          onPressed: () {

                          },
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context, builder: (builder)=>
                              bottomsheet(),);
                            },
                                icon: Icon(Icons.attach_file)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.camera_alt))
                          ],
                        ),
                        //contentPadding: EdgeInsets.all(5.0)
                      ),),

                      margin: const EdgeInsets.only(right: 2.0, left: 2.0, bottom: 8.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),),
                  ),
                  const Padding(padding: EdgeInsets.only(
                    bottom: 8,
                    right: 2,
                    left: 2,
                  )),
                  const CircleAvatar(
                    backgroundColor: Color(0xFF128C7E),
                    radius: 23.0,
                    child:
                    Icon(Icons.mic,
                      size: 21.0, color: Colors.white,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget bottomsheet()
{
  return Container(
    height: 278,
    width: MediaQuery.of(context).size.width,
    child: Card(
         margin: EdgeInsets.all(18.0),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreat(Icons.insert_drive_file,Colors.indigoAccent,"Document"),
                const SizedBox(width:40),
                iconcreat(Icons.camera_alt,Colors.pinkAccent,"Camera"),
                const SizedBox(width:40),
                iconcreat(Icons.insert_photo,Colors.purpleAccent,"Gallery"),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreat(Icons.headset,Colors.deepOrangeAccent,"Audio"),
                const SizedBox(width:40),
                iconcreat(Icons.location_on,Colors.green,"Location"),
                const SizedBox(width:40),
                iconcreat(Icons.person,Colors.blueAccent,"Gallery"),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
   Widget iconcreat(IconData icon,Color color, String text)
   {
     return Column(
       children: [
         CircleAvatar(
           radius: 30,
             backgroundColor: color,
             child: Icon(
               icon,
               color: Colors.white,
               size: 26,
             ),
         ),
         SizedBox(height: 5,),
         Text(text,
         style: TextStyle(
           fontSize:12,

         ),),
       ],
     );
   }
}

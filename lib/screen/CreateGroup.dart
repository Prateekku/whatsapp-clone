import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chatmodel/Chatmodel.dart';
import 'package:whatsapp_clone/CustomUi/Avatar.dart';
import 'package:whatsapp_clone/CustomUi/Button.dart';
import 'package:whatsapp_clone/CustomUi/Contactcard.dart';
import 'package:whatsapp_clone/CustomUi/CustomCard.dart';
class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<Chatmodel> contacts = [
    Chatmodel(name:"Deep", Status: "using whatsapp", isGroup: false, currentMessage: " ", time: "2:30", icon: " ", select:false),
    Chatmodel(name:"ravi friends", Status: "using whatsapp", isGroup: true, currentMessage: " ", time: " ", icon: " ", select: false),
    Chatmodel(name:"das", Status: "using whatsapp", isGroup: false, currentMessage: " ", time: " ", icon: " ", select: false)
  ];
  List<Chatmodel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Group",style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold
              ),),
              Text("Add Participant",style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 26,)),

          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length+1,
                itemBuilder: (context, index) {
                  if(index == 0)
                    {
                      return Container(
                        height: groups.length>0?90:10,
                      );
                    }
                  return InkWell(
                      onTap: ()
                      {
                        if(contacts[index-1].select == false)
                          {
                            setState(() {
                              contacts[index-1].select = true;
                              groups.add(contacts[index-1]);
                            });
                          }
                        else
                          {
                            setState(() {
                              contacts[index-1].select = false;
                              groups.remove(contacts[index-1]);
                            });
                          }

                      },
                      child: Contactcard(contact: contacts[index-1]));
                }

            ),
           groups.length>0? Column(
              children: [
                Container(
                  child: ListView.builder(itemBuilder: (context,index)
                  {
                    if(contacts[index].select == true)
                      {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              groups.remove(contacts[index]);
                              contacts[index].select = false;
                            });
                          },
                          child: Avatar(
                            contact: contacts[index],
                          ),
                        );
                      }
                    else
                      {
                        return Container();
                      }
                  },
                  itemCount: contacts.length,
                  scrollDirection: Axis.horizontal,),
                  height: 75,
                  color: Colors.white,
                ),
                Divider(thickness: 1.0,
                ),
              ],

            ):Container(),

          ],
        )
    );
  }
}

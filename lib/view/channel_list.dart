import 'package:adminapp/view/channel_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChannelsList extends StatefulWidget {
  const ChannelsList({Key? key}) : super(key: key);

  @override
  State<ChannelsList> createState() => _ChannelsListState();
}

class _ChannelsListState extends State<ChannelsList> {
  final firestore = FirebaseFirestore.instance.collection('channels').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection("channels");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Column(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream:firestore ,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              if (snapshot.hasError) return Text("some errror");


              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {


                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 5,
                          child: Container(

                            height: size.height*0.28,

                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(children: [
                             Container(
                               height : size.height*.06,
                               decoration: BoxDecoration(
                                   gradient: LinearGradient(
                                     begin: Alignment.topRight,
                                     end: Alignment.bottomLeft,
                                     colors: [
                                       Colors.purpleAccent,
                                       Colors.purple,
                                     ],
                                   )
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   Container(

                                     child: Text(
                                       "Channels Name",
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold
                                       ),
                                     ),
                                   ),
                                   Divider(

                                     thickness: 3,
                                     height: 2,
                                     color: Colors.black54,
                                   ),
                                   Container(

                                     child: Text(
                                      " Channels Link",
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 22,
                                         fontWeight: FontWeight.bold
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                              SizedBox(height: size.height*.05,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(

                                    child: Text(
                                      snapshot.data!.docs[index]['name']
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Divider(

                                    thickness: 3,
                                    height: 2,
                                    color: Colors.black54,
                                  ),
                                  Container(

                                    child: Text(
                                      snapshot.data!.docs[index]['link']
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height*.02,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  InkWell(
                                    onTap: (){  ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.purple,
                                        child: Icon(Icons.delete,color: Colors.white,semanticLabel: 'delete',),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Delete"),

                                ],
                              )


                            ]),
                          ),
                        ),

                      );
                    }),
              );
            }),
      ],
    );
  }
}
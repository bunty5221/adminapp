import 'package:adminapp/view/Match_form.dart';
import 'package:adminapp/view/channel_form.dart';

import 'package:adminapp/view/channel_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'match_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;



  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final firestore = FirebaseFirestore.instance
      .collection("matches").snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection("channels");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Admin Panel",style: TextStyle(color: Colors.white),),
          bottom: TabBar(
            labelColor: Colors.white,

              tabs: [
            Tab(
              text: "Channels",
              icon: Icon(Icons.list_alt,color: Colors.white,),
            ),
            Tab(
              text: "Matches",
              icon: Icon(Icons.sports_cricket,color: Colors.white,),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            ChannelsList(),
            MatchList(),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChannelsForms()));
                },

                  child: Icon(Icons.edit)),
              label: 'Add Channels',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchesForm()));
                },

                  child: Icon(Icons.edit)),
              label: "Add Matches",
            ),

          ],
        ),

      ),

    );
  }
}


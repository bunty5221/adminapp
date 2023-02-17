import 'package:adminapp/view/Match_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class MatchList extends StatefulWidget {
  const MatchList({Key? key}) : super(key: key);

  @override
  State<MatchList> createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
    final firestore =
    FirebaseFirestore.instance.collection('matches').snapshots();
    CollectionReference ref = FirebaseFirestore.instance.collection("matches");

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
                          child:Card(
                            elevation: 5,
                            child: Container(

                              height: size.height*0.35,

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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(

                                        child: Text(
                                          "Tournament ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.width*.05,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: size.width*.02,),
                                      Container(

                                        child: Text(
                                          "Matches",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.width*.05,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Container(

                                    child: Text(
                                      snapshot.data!.docs[index]['tournament']
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width*.04,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(

                                    child: Text(
                                      snapshot.data!.docs[index]['date']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.width*.03,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: size.height*.015,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(

                                      child: Text(
                                        snapshot.data!.docs[index]['team1']
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.width*.045,
                                        ),
                                      ),
                                    ),


                                    Container(

                                      child: Text(
                                        "VS",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.width*.055,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Container(

                                      child: Text(
                                        snapshot.data!.docs[index]['team2']
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.width*.045,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height*.01,),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                                SizedBox(height: size.height*.01,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Favourite Team:",style: TextStyle(
                                      color: Colors.grey
                                    ),),
                                    
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: size.height*.04,
                                          width: size.width*.09,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.red.withOpacity(0.3)
                                          ),
                                          child: Center(
                                            child: Text(snapshot.data!.docs[index]['team1'].toString(),style: TextStyle(
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                        SizedBox(width: size.width*.03,),
                                        Container(
                                          height: size.height*.04,
                                          width: size.width*.1,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                              color: Colors.indigo.withOpacity(0.3)
                                          ),

                                          child: Center(
                                            child: Text(snapshot.data!.docs[index]['odd1'].toString(),style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                        SizedBox(width: size.width*.01,),
                                        Container(
                                          height: size.height*.04,
                                          width: size.width*.1,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                              color: Colors.red.withOpacity(0.3)
                                          ),
                                          child: Center(
                                            child: Text(snapshot.data!.docs[index]['odd2'].toString(),style: TextStyle(
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: size.height*.01,),
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
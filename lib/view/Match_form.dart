import 'package:adminapp/view/widget/input_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchesForm extends StatefulWidget {
  const MatchesForm({Key? key}) : super(key: key);

  @override
  State<MatchesForm> createState() => _MatchesFormState();
}

class _MatchesFormState extends State<MatchesForm> {

  final firestore = FirebaseFirestore.instance.collection('matches');

  TextEditingController team1 = TextEditingController();
  TextEditingController team2 = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController odd1 = TextEditingController();
  TextEditingController odd2 = TextEditingController();

  TextEditingController stadium = TextEditingController();
  TextEditingController tournament = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CREATE MATCHES',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .08,
              ),
              InputWidget(
                textController: team1,
                preicon: Icon(Icons.sports_cricket),
                label: 'Team1',
              ),
              InputWidget(
                textController: team2,
                preicon: Icon(Icons.sports_cricket),
                label: 'Team2',
              ),
              InputWidget(
                textController: stadium,
                preicon: Icon(Icons.sports_cricket),
                label: 'Stadium',
              ),
              InputWidget(
                textController: tournament,
                preicon: Icon(Icons.sports_cricket),
                label: 'Tournament',
              ),
              InputWidget(
                textController: date,
                preicon: Icon(Icons.date_range),
                label: 'Date',
              ),
              InputWidget(
                textController: odd1,
                preicon: Icon(Icons.control_point),
                label: 'odd1',
              ),
              InputWidget(
                textController: odd2,
                preicon: Icon(Icons.control_point),
                label: 'odd2',
              ),

              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    String id = DateTime.now().microsecondsSinceEpoch.toString();

                    firestore
                        .doc(id)
                        .set({
                      'id': id,
                      'team1': team1.text,
                      'team2': team2.text,
                      'stadium': stadium.text,
                      'tournament': tournament.text,
                      'date': date.text,
                      'odd1': odd1.text,
                      'odd2': odd2.text,
                    })
                        .then((value) => {
                          team1.clear(),

                      team1.clear(),
                      team2.clear(),
                      stadium.clear(),
                      tournament.clear(),
                      date.clear(),
                       Navigator.pop(context),
                      debugPrint("succesful"),
                    })
                        .onError((error, stackTrace) => {});
                  },
                  child: Text('ADD MATCH')),
            ],
          ),
        ),
      ),
    );
  }
}

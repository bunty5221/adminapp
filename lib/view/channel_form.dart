import 'package:adminapp/view/widget/input_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChannelsForms extends StatefulWidget {
  const ChannelsForms({Key? key}) : super(key: key);

  @override
  State<ChannelsForms> createState() => _ChannelsFormsState();
}

class _ChannelsFormsState extends State<ChannelsForms> {
  final firestore = FirebaseFirestore.instance.collection('channels');

  TextEditingController name = TextEditingController();
  TextEditingController link = TextEditingController();

  TextEditingController description = TextEditingController();
  TextEditingController type = TextEditingController();



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ADD CHANNELS',
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
                textController: name,
                preicon: Icon(Icons.sports_cricket),
                label: 'Name',
              ),
              InputWidget(
                textController: link,
                preicon: Icon(Icons.sports_cricket),
                label: 'Link',
              ),
              InputWidget(

                textController: description,
                preicon: Icon(Icons.description),
                label: 'Description',
              ),
              InputWidget(
                textController: type,
                preicon: Icon(Icons.description),
                label: 'TYPE',
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
                      'name': name.text,
                      'link': link.text,
                      'description': description.text,
                      'type': type.text,


                    })
                        .then((value) => {
                      name.clear(),
                      link.clear(),
                      Navigator.pop(context),
                      debugPrint("succesful"),
                    })
                        .onError((error, stackTrace) => {});
                  },
                  child: Text('ADD CHANNELS')),
            ],
          ),
        ),
      ),
    );
  }
}

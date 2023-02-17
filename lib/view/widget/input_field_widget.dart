import 'package:flutter/material.dart';


class InputWidget extends StatelessWidget {
  TextEditingController textController;
  Icon preicon;
  String label ;
  InputWidget({Key? key,required this.textController,required this.preicon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

      child: TextFormField(
        controller: textController,

        decoration: InputDecoration(
          prefixIcon: preicon,

          label: Text(label),
          border: OutlineInputBorder(),

        ),


      ),



    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({Key? key}) : super(key: key);

  @override
  _AddRecordViewState createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime  _selecetedDate = DateTime.now();

  void pickDate(BuildContext context) async{
    var initialDate = DateTime.now();
      _selecetedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: initialDate.subtract(Duration(days: 365)),
          lastDate: initialDate.add(Duration(days:30)),
          builder: (context,child){
              return Theme(data: ThemeData.light().copyWith(
                colorScheme: ColorScheme(
                  primary: Colors.black,
                  primaryVariant: Colors.black,
                  secondary: Colors.yellow,
                  secondaryVariant: Colors.yellowAccent,
                  surface: Colors.blue,
                  background: Colors.blueAccent,
                  error: Colors.red,
                  onPrimary: Colors.white,
                  onSecondary: Colors.brown,
                  onSurface: Colors.black26,
                  onBackground: Colors.blueGrey,
                  onError: Colors.orange,
                  brightness: Brightness.light,
                )
              ), child: child ?? Text(""));
          }

      )
          ?? _selecetedDate;

      setState((){});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Record"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.weight,
                    size: 40,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      NumberPicker(
                        axis: Axis.horizontal,
                        itemCount: 3,
                        minValue: 10,
                        maxValue: 250,
                        value: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.chevronUp,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              pickDate(context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      size: 40,
                    ),
                    Expanded(
                      child: Text(
                        DateFormat('EEE, MMM, d').format(_selecetedDate),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                 children:  [
                   Icon(
                     FontAwesomeIcons.evernote,
                     size: 40,
                   ),
                   Expanded(
                       child:TextField (
                         autofocus: true,
                         decoration: InputDecoration(
                             border: InputBorder.none,
                             labelText: 'Enter Name',
                             hintText: 'Enter Your Name'
                         ),
                       )
                        )
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Save Record"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
          ),

        ],
      ),
    );
  }
}

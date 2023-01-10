import 'dart:html';

///import 'package:currency_converter/widget/drop_down.dart';
import 'package:currency_converter/services/convertIt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:currency_converter/services/api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF212936);
  Color secondColor = Color(0xFF2849E5);
  int valueInputed = 0;
  int currencies = 0;
  String finalResult = '0';
  int valueInt = 0;
  String networkHelper = '';
  String nCur = 'IDR to USD ';
  int nilaiCur = 0;
  String? inputed;

  void pilihCur(String value) {
    //menampilkan kota yang dipilih
    setState(() {
      nCur = value;
    });
  }

  void selectedCur(int value) {
    //menampilkan kota yang dipilih
    setState(() {
      currencies = value;
    });
  }

  void sendTextFieldValue(String value) {
    setState(() {
      inputed = value;
    });
  }

  static const List<String> cur = <String>[
    'IDR to USD ',
    'USD to IDR',
  ];
  String dropdownValue = 'IDR';
  String dropsdownValue2 = 'IDR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200.0,
              child: Text(
                'Currency Converter',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (valuethis) {
                      setState(() {
                        valueInputed = int.parse(valuethis);
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Input Value to Convert',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          color: secondColor,
                        )),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      Text('  '),
                      DropdownButton<String>(
                        value: nCur,
                        dropdownColor: Colors.grey,
                        alignment: Alignment.center,
                        menuMaxHeight: 150,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? value) {
                          pilihCur(value ?? "");
                          nilaiCur = cur.indexOf(value ?? "");
                          selectedCur(nilaiCur);
                        },
                        items: cur.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 24.0),
                            ),
                          );
                        }).toList(),
                      ),
                      Text('      '),
                      Text('     '),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  Text(
                    '    ',
                    style: TextStyle(fontSize: 30),
                  ),
                  MaterialButton(
                    child: Text("CONVERT"),
                    color: Colors.grey,
                    textColor: Colors.white,
                    onPressed: () {
                      print(currencies);
                      print(valueInputed);

                      ConvertIt conv = new ConvertIt(
                          valueInputed: valueInputed, currencies: nilaiCur);
                      setState(() {
                        finalResult = conv.getFinal();
                      });
                    },
                  ),
                  Text('          '),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 1200,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text(
                      finalResult,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

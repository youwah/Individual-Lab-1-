import 'dart:math';

import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  final TextEditingController _dcontroller = TextEditingController();
  double a = 0.000, b= 0.000 , c = 0.000, d = 0.000, result = 0.000, meter, result1 = 0.000, result2 = 0.000, result3 = 0.000, result0= 0.000;
  String absi ;
  double result4;
  int _value =0;
  String absiMean;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('ABSI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Male"),
                      value: 0,
                    ),
                    DropdownMenuItem(
                      child: Text("Women"),
                      value: 1,
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Age",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _acontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Height(cm)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _bcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Weight(kg)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _ccontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Waist Circumference(Inch)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _dcontroller,
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(5),
              // ignore: deprecated_member_use
              child: RaisedButton(
                child: Text("Calculate ABSI"),
                onPressed: _onPress,
              ),
            ),
            Text("ABSI: $absi"),
            
          ],
        ),
      ),
    );
  }
  void _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
      c = double.parse(_ccontroller.text);
      d = double.parse(_dcontroller.text);
      result0= b / 100.0;
      result = c / (result0 * result0);
      result1=pow(result,2/3);
      result2=pow(result0,1/2);
      result3= d / 39.37;
      result4= result3 /  (result1 * result2);
      absi = format(result4);

    });

    
  }
  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}

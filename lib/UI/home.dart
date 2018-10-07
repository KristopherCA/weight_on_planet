import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  /* Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html

  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06

  surface gravity formula:
  weight = mass * multiplier

  */
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final _snackBar = SnackBar(content: Text('Please Enter Your Weight before choosing a planet!'), backgroundColor: Colors.black38 ,);
  final TextEditingController _weightController = TextEditingController();
  int _radioValue;
  double _finalResult = 0.0;
  String _imagePath = 'images/planets/planetx.png';
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _finalResult = calculateWeight(
            _weightController.text,
            0.38,
          );
          _imagePath = 'images/planets/mercury.png';
          _formattedText =
              "Your weight on Mercury is: ${_finalResult.toStringAsFixed(2)}";
          break;

        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _imagePath = 'images/planets/venus.png';
          _formattedText =
              "Your weight on Venus is: ${_finalResult.toStringAsFixed(2)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 1.00);
          _imagePath = 'images/planets/earth.png';
          _formattedText =
              "Your weight on Earth is: ${_finalResult.toStringAsFixed(2)}";
          break;
        case 3:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _imagePath = 'images/planets/mars.png';
          _formattedText =
              "Your weight on Mars is: ${_finalResult.toStringAsFixed(2)}";
          break;
        case 4:
          _finalResult = calculateWeight(_weightController.text, 2.34);
          _imagePath = 'images/planets/jupiter.png';
          _formattedText =
              "Your weight on Jupiter is: ${_finalResult.toStringAsFixed(2)}";
          break;
        case 5:
          _finalResult = calculateWeight(_weightController.text, 1.06);
          _imagePath = 'images/planets/saturn.png';
          _formattedText =
              "Your weight on Saturn is: ${_finalResult.toStringAsFixed(2)}";
          break;
        case 6:
          _finalResult = calculateWeight(_weightController.text, 0.92);
          _imagePath = 'images/planets/uranus.png';
          _formattedText =
              "Your weight on Uranus is: ${_finalResult.toStringAsFixed(2)}";
          break;
        case 7:
          _finalResult = calculateWeight(_weightController.text, 1.19);
          _imagePath = 'images/planets/neptune.png';
          _formattedText =
              "Your weight on Neptune is: ${_finalResult.toStringAsFixed(2)}";
      }

      if (_radioValue >= 0) {
        FocusScope.of(context).requestFocus(new FocusNode());
      }

      if (_weightController.text.isEmpty) {
        _scaffoldKey.currentState.showSnackBar(_snackBar);
        FocusScope.of(context).requestFocus(new FocusNode());

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(4.5),
          children: <Widget>[
            Image.asset(
              _imagePath,
              fit: BoxFit.fitHeight,
              height: 150.0,
              width: 200.0,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    style: TextStyle(fontSize: 20.0),
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Please Enter Your Weight",
                        hintText: "lbs",
                        icon: Icon(Icons.person_outline)),
                  ),
                  Padding(padding: EdgeInsets.all(25.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.brown.shade700,
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Mercury",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Radio<int>(
                          activeColor: Colors.yellow.shade900,
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Venus",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Radio<int>(
                          activeColor: Colors.yellow.shade400,
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Earth",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Radio<int>(
                        activeColor: Colors.redAccent,
                        value: 3,
                        groupValue: _radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text(
                        "Mars",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(25.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.orange.shade500,
                          value: 4,
                          groupValue: _radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Jupiter",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 5,
                          groupValue: _radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Saturn",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Radio<int>(
                          activeColor: Colors.blue,
                          value: 6,
                          groupValue: _radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Uranus",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Radio<int>(
                        activeColor: Colors.blue.shade800,
                        value: 7,
                        groupValue: _radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text(
                        "Neptune",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(30.6)),
                  Text(
                      _weightController.text.toString().isNotEmpty
                          ? "$_formattedText" 'lbs'
                          : "Find Your Weight on:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (weight.isNotEmpty && _radioValue > 0) {
      return int.parse(weight) * multiplier;
    } else {
      return int.parse("189") * 0.38;
    }
  }
}

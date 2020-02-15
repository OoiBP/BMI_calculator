import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget viewDrawer = Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
          ),
          child: Text(
            'Customize It',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        drawer: viewDrawer,
        body: MainView(),
      ),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  bool _isMale = true;
  num _weight = 50.0;
  num _height = 170.0;

  @override
  Widget build(BuildContext context) {
    void _changeMale() {
      setState(() {
        _isMale = true;
      });
    }

    void _changeFemale() {
      setState(() {
        _isMale = false;
      });
    }

    void _weightSliderChange(double newValue) {
      setState(() {
        _weight = newValue.toInt();
      });
    }

    void _heightSliderChange(double newValue) {
      setState(() {
        _height = newValue.toInt();
      });
    }

    Widget txtLabel(String text, num item) {
      return Container(
        margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0),
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
        child: Text(
          "$text: $item",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.centerLeft,
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          GenderSelectionView(_changeMale, _changeFemale),
          txtLabel("Weight", _weight),
          WeightSlider(_weight, _weightSliderChange),
          txtLabel("Height", _height),
          HeightSlider(_height, _heightSliderChange),
        ],
      ),
    );
  }
}

class GenderSelectionView extends StatelessWidget {
  final _onPressMale;
  final _onPressFemale;

  GenderSelectionView(this._onPressMale, this._onPressFemale);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MaleGenderButton(_onPressMale),
        FemaleGenderButton(_onPressFemale),
      ],
    );
  }
}

class MaleGenderButton extends StatelessWidget {
  final Function _onPress;

  MaleGenderButton(this._onPress);

  static const boy = LinearGradient(
    colors: <Color>[
      Colors.blue,
      Color(0xFF64B5F6),
      Color(0xFFBBDEFB),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        gradient: boy,
      ),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30.0),
        color: Colors.transparent,
        icon: Icon(MdiIcons.genderMale),
        onPressed: _onPress,
        label: Text("Male"),
      ),
    );
  }
}

class FemaleGenderButton extends StatelessWidget {
  final Function _onPress;

  FemaleGenderButton(this._onPress);

  static const girl = LinearGradient(
    colors: <Color>[
      Colors.pink,
      Color(0xFFF06292),
      Color(0xFFF8BBD0),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        gradient: girl,
      ),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30.0),
        color: Colors.transparent,
        icon: Icon(MdiIcons.genderFemale),
        onPressed: _onPress,
        label: Text("Female"),
      ),
    );
  }
}

class WeightSlider extends StatelessWidget {
  final num _value;
  final Function _onChange;

  WeightSlider(this._value, this._onChange);

  @override
  Widget build(BuildContext context) {
    final double _minimum = 40.0;
    final double _maximum = 200.0;
    final int _divs = (_maximum - _minimum + 1.0).toInt();

    return Slider(
      value: _value.toDouble(),
      onChanged: _onChange,
      min: _minimum,
      max: _maximum,
      label: _value.toString(),
      divisions: _divs,
    );
  }
}

class HeightSlider extends StatelessWidget {
  final num _value;
  final Function _onChange;

  HeightSlider(this._value, this._onChange);

  @override
  Widget build(BuildContext context) {
    final double _minimum = 120.0;
    final double _maximum = 230.0;
    final int _divs = (_maximum - _minimum + 1.0).toInt();

    return Slider(
      value: _value.toDouble(),
      onChanged: _onChange,
      min: _minimum,
      max: _maximum,
      label: _value.toString(),
      divisions: _divs,
    );
  }
}

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

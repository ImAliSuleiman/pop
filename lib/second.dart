import 'package:flutter/material.dart';

import 'third.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _result != null
                  ? 'Data returned:'
                  : 'No data to show.\nPlease proceed forward.',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              _result != null ? _result.toString() : '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoThird,
        tooltip: 'Go Forward',
        child: Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _gotoThird() {
    // Capture data sent from fourth page
    Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThirdPage()))
        .then((_) {
      var args = ModalRoute.of(context).settings.arguments as Map;
      if (args != null && args['data'] != null)
        setState(() => _result = args['data']);
    });
  }
}

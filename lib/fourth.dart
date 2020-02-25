import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _popUntilSecond(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fourth Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.grey[200],
                elevation: 0,
                margin: EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    maxLength: 30,
                    decoration: InputDecoration(
                        icon: Icon(Icons.edit, color: Colors.grey),
                        hintText: 'Write something here...',
                        border: InputBorder.none,
                        fillColor: Colors.grey[300],
                        contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[500],
                        ),
                        counterText: ''),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _popUntilSecond,
          tooltip: 'Return',
          child: Icon(Icons.keyboard_return),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  _popUntilSecond() async {
    // Pop until second page
    // Send data captured through text field to second page
    Navigator.popUntil(context, (route) {
      var isSecondPage = route.settings.name == 'SecondPage';
      if (isSecondPage)
        (route.settings.arguments as Map)['data'] = _controller.text;

      return isSecondPage;
    });
  }
}

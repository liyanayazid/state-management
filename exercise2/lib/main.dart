import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:exercise2/textformat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: ButtonWidget());
  }
}

// ignore: use_key_in_widget_constructors
class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final _textBloc = TextBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Capitalize text'),
        ),
        body: Column(
          children: [
            StreamBuilder(
                stream: _textBloc.textStream,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  return Column(
                    children: [
                      TextField(
                        onChanged: (String text) => _textBloc.updateText(text),
                      ),
                      FloatingActionButton(
                        // When the user presses the button, show an alert dialog containing
                        // the text that the user has entered into the text field.
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                content: Text(
                                    (snapshot.hasData ? snapshot.data : "")
                                        .toString()
                                        .toUpperCase()),
                              );
                            },
                          );
                        },
                        tooltip: 'Show me the value!',
                        child: const Icon(Icons.text_fields),
                      ),
                    ],
                  );
                }),
          ],
        ));
  }
}

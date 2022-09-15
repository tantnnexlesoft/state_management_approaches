
import 'package:flutter/material.dart';

import 'bloc.dart';

class CountPage extends StatefulWidget {
  CountPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {

  final bloc = RemoteBloc();


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<RemoteState>(
              stream: bloc.stateController.stream,
              initialData: bloc.state,
              builder: (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
                return Text(
                  ' ${snapshot.data?.counter ?? '0'}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          Container(
            margin: const EdgeInsets.only(right: 10),
            child: FloatingActionButton(
              heroTag: "add",
              onPressed: () => bloc.eventController.sink.add(IncrementEvent(1)),
              child: Icon(Icons.add),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: FloatingActionButton(
              heroTag: "remove",
              onPressed: () => bloc.eventController.sink.add(DecrementEvent(1)),
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
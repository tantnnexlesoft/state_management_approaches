
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_approaches/count/counter.dart';

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



  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterModel.count}',
              style: Theme.of(context).textTheme.headline4,
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
              heroTag: 'add',
              onPressed: () => counterModel.increment(),
              child: Icon(Icons.add),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: FloatingActionButton(
              heroTag: 'remove',
              onPressed: () => counterModel.decrement(),
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
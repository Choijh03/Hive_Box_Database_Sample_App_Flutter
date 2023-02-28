import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //reference the box
    final _myBox = Hive.box('mybox');

    //write data
    //it's possible to put list of different types value
    void writeData() {
      _myBox.put(1, "Mitch");
      _myBox.put(2, "John");
      _myBox.put(3, ['Mitch', 26, 'Purple']);
    }

    //read data
    void readData() {
      print(_myBox.get(3, 0));
      print(_myBox.get(2));
    }

    //delete data
    void deleteData() {
      _myBox.delete(3);
    }

    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: writeData,
            child: Text('Write'),
            color: Colors.blue[200],
          ),
          MaterialButton(
            onPressed: readData,
            child: Text('Read'),
            color: Colors.blue[200],
          ),
          MaterialButton(
            onPressed: deleteData,
            child: Text('Delete'),
            color: Colors.blue[200],
          ),
        ],
      ),
    ));
  }
}

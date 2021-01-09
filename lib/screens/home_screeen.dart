import 'package:flutter/material.dart';
import 'package:todoist/screens/add_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddScreen())),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "My Tasks",
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      )
                    ]));
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            margin: EdgeInsets.all(20.0),
            width: double.infinity,
            child: _listContainer(index),
          );
        },
      ),
    );
  }

  _listContainer(int index) {
    return ListTile(
      title: Text("Title $index"),
      subtitle: Text(DateTime.now().toString()),
      trailing: Checkbox(
        checkColor: Colors.red,
        value: false,
        onChanged: (value) => {print(value)},
      ),
    );
  }
}

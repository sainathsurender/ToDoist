import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _category = '';
  DateTime _startDate = DateTime.now();
  final _dateFormatter = DateFormat('MMM dd, yyyy');
  TextEditingController _dateController = TextEditingController();
  final List<String> Categories = ['Work', 'Home', 'Personal'];

  _tapEvent() async {
    final _date = await showDatePicker(
        context: context,
        initialDate: _startDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2022));

    if (_date != null && _date != _startDate) {
      setState(() {
        _startDate = _date;
      });

      _dateController.text = _dateFormatter.format(_date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "Add Task",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  labelText: 'Task Name',
                                  labelStyle: TextStyle(fontSize: 20.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                validator: (input) =>
                                    input.trim().isEmpty ? 'Enter Title' : null,
                                onSaved: (input) => _title = input,
                                initialValue: _title,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              DropdownButtonFormField(
                                isDense: true,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 32.0,
                                iconEnabledColor:
                                    Theme.of(context).primaryColor,
                                items: Categories.map((String category) {
                                  return DropdownMenuItem(
                                      value: category,
                                      child: Text(
                                        category,
                                        style: TextStyle(color: Colors.black),
                                      ));
                                }).toList(),
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  labelText: 'Category',
                                  labelStyle: TextStyle(fontSize: 20.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                validator: (input) => _category == null
                                    ? 'Please select a Category'
                                    : null,
                                onSaved: (input) => _category = input,
                                onChanged: (value) {
                                  setState(() {
                                    _category = value.toString();
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                readOnly: true,
                                controller: _dateController,
                                onTap: _tapEvent,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  labelText: 'Start Date',
                                  labelStyle: TextStyle(fontSize: 20.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 50.0),
                                height: 60.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: FlatButton(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            )));
  }
}

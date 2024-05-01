import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Book_page(),
    );
  }
}

// ignore: camel_case_types
class Book_page extends StatefulWidget {
  const Book_page({super.key});

  @override
  State<Book_page> createState() => _Book_pageState();
}

// ignore: camel_case_types
class _Book_pageState extends State<Book_page> {
  // text editing controller to make changes in the text entered in the so and so.
  final _booknamecontroller = TextEditingController();
  final _authornamecontroller = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void clearText() {
    _booknamecontroller.clear();
    _authornamecontroller.clear();
    _priceController.clear();
  }

  @override
  void dispose() {
    _authornamecontroller.dispose();
    _booknamecontroller.dispose();
    _priceController.dispose();
    super.dispose();
  }

  // initial value of dropdown box
  String dropdownvalue = 'Bandra';

  // list of values for dropdown.
  var branchs = [
    'Mahim',
    'Byculla',
    'Bombay Central',
    'khar road',
    'Thane',
    'Borivali',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 10,
        title: const Text('Book Page', textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text.
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Enter Book Details',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.italic),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Book Name:',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _booknamecontroller,
                              decoration: const InputDecoration(
                                hintText: 'Enter Book Name',
                                fillColor: Colors.red,
                                // border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a book name';
                                }
                                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                                  return 'Book name must only contain letters';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Publisher Name:',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _authornamecontroller,
                              decoration: const InputDecoration(
                                hintText: 'Enter Publisher Name',
                                fillColor: Colors.red,
                                // border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter publisher name';
                                } else if (!RegExp(r'^[a-zA-Z\s]+$')
                                    .hasMatch(value)) {
                                  return 'Publisher name can only have alphabets';
                                }
                              },
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Book Price:         ',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _priceController,
                              decoration: const InputDecoration(
                                hintText: 'Enter Book Price',
                                fillColor: Colors.red,
                                // border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter book price';
                                }
                                final price = double.tryParse(value);
                                if (price == null || price < 0) {
                                  return 'Price cannot be negative';
                                }
                              },
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Branch Name:',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          Flexible(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(2.0),
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),
                              // Array list of items
                              items: branchs.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      // Clear Button Details.....
                      Row(
                        children: [
                          const SizedBox(
                            width: 105,
                          ),
                          ElevatedButton(
                              onPressed: clearText,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text(
                                'Add',
                                style: TextStyle(fontSize: 27),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Issue_page()));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text(
                                'Proceed',
                                style: TextStyle(fontSize: 27),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

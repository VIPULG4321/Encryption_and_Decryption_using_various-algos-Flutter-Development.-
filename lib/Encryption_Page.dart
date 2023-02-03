import 'package:flutter/material.dart';

class Encryption1 extends StatefulWidget {
  const Encryption1({Key? key}) : super(key: key);

  @override
  State<Encryption1> createState() => _Encryption1State();
}
class _Encryption1State extends State<Encryption1> {
  List dropDownListData = [
    {"title": "Advanced Encryption Standard", "value": "1"},
    {"title": "Fernet Algorithm", "value": "2"},
    {"title": "Salsa20 Algorithm", "value": "3"},
  ];


  String selectedCourseValue = "";
  var encryptedText;
  var plaintext;
  var new_plaintext;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(child: Text("Encryption Page")),
        ),
        body: SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCourseValue,
                        isDense: true,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          const DropdownMenuItem(
                              child: Text(
                                "Please Select",
                              ),
                              value: ""),
                          ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                                child: Text(data['title']), value: data['value']);
                          }).toList(),
                        ],
                        onChanged: (newValue) {
                          setState(
                                () {
                              selectedCourseValue = newValue!;
                              print(selectedCourseValue);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      ElevatedButton(
                        onPressed: () {
                          if (selectedCourseValue == "") {
                            print("Please Select a course");
                          }
                          else if (selectedCourseValue == "1") {
                            setState(() {
                              Navigator.pushNamed(context, '/AES_page');
                            });
                            //   log("encrypted text : $encryptedText");
                          }
                          else if (selectedCourseValue == "2") {
                            setState(() {
                              Navigator.pushNamed(context, '/Fernet_page');
                            });
                          }
                          else if (selectedCourseValue == "3") {
                            setState(() {
                              Navigator.pushNamed(context, '/Salsa20_page');
                            });
                          }
                          else {
                            print("Selected Course Value $selectedCourseValue");
                          }
                        },
                        child: const Text("Click Here"),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

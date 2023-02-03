import 'package:flutter/material.dart';

class Hash_page extends StatefulWidget {
  const Hash_page({Key? key}) : super(key: key);

  @override
  State<Hash_page> createState() => _Hash_pageState();
}
class _Hash_pageState extends State<Hash_page> {
  List dropDownListData = [
    {"title": "SHA-1", "value": "1"},
    {"title": "SHA-256", "value": "2"},
    {"title": "SHA-384", "value": "3"},
    {"title": "SHA-512", "value": "4"},
    {"title": "MD5", "value": "5"},
  ];

  String selectedCourseValue = "";
  var encryptedText;
  var plaintext;
  var new_plaintext;

  // static TextEditingController tec = TextEditingController();   //this is controlling main text box
  // var plaintext;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(child: Text("Hashing Page")),
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
                              Navigator.pushNamed(context, '/sha1_page');
                            });
                            //   log("encrypted text : $encryptedText");
                          }
                          else if (selectedCourseValue == "2") {
                            setState(() {
                              Navigator.pushNamed(context, '/sha256_page');
                            });
                          }
                          else if (selectedCourseValue == "3") {
                            setState(() {
                              Navigator.pushNamed(context, '/sha384_page');
                            });
                          }
                          else if (selectedCourseValue == "4") {
                            setState(() {
                              Navigator.pushNamed(context, '/sha512_page');
                            });
                          }
                          else if (selectedCourseValue == "5") {
                            setState(() {
                              Navigator.pushNamed(context, '/md5_page');
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

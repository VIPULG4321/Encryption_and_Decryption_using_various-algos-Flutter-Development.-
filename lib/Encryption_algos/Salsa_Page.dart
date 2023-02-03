import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:clipboard/clipboard.dart';

import '../MyEncryption_Decryption.dart';
import '../main.dart';

class Salsa20_Page extends StatefulWidget {
  const Salsa20_Page({Key? key}) : super(key: key);

  @override
  State<Salsa20_Page> createState() => _Salsa20_PageState();
}
class _Salsa20_PageState extends State<Salsa20_Page> {

  var encryptedText;
  var plaintext;
  var new_plaintext;
  TextEditingController tec = TextEditingController();

  // static TextEditingController tec = TextEditingController();   //this is controlling main text box
  // var plaintext;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(child: Text("Salsa20 Encryption")),
        ),
        body: SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: tec,
                    decoration: const InputDecoration(
                      labelText: 'Enter your message here..',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: TextField(
                    controller: key_tec,
                    decoration: const InputDecoration(
                      labelText: 'Enter 128-bits(16 Character) key..',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                //end

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          plaintext = tec.text;
                          setState(() {
                            encryptedText = MyEncryptionDecryption.encryptSalsa20(plaintext);   //encryptAES function is called from MyEncryptionDecryption class...
                          });
                        },
                        child: const Text("Encrypt"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          plaintext = tec.text;
                          setState(() {
                            encryptedText = MyEncryptionDecryption.decryptSalsa20(encryptedText);   //encryptAES function is called from MyEncryptionDecryption class...
                          });
                        },
                        child: const Text("Decrypt"),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text('Your Generated TEXT',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue[400],
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(encryptedText == null ? "Your Encrypted text is here.." : encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 50.0,right: 50.0),
                  child: TextButton(
                    onPressed: () async {
                      FlutterClipboard.copy(encryptedText.base64)
                          .then(
                            (value) {
                          return ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Text Copied'),
                            ),
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: const Text(
                      'Copy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

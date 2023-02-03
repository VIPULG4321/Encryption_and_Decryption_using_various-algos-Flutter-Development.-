import 'package:flutter/material.dart';
import 'package:untitled5/Encryption_algos/AES_Page.dart';
import 'package:untitled5/Encryption_algos/Salsa_Page.dart';
import 'package:untitled5/Hash_Algos/MD5_Page.dart';
import 'package:untitled5/Hash_Algos/SHA1_Page.dart';
import 'package:untitled5/Hash_Algos/SHA256_Page.dart';
import 'package:untitled5/Hash_Algos/SHA384_Page.dart';
import 'package:untitled5/Hash_Algos/SHA512_Page.dart';
import 'package:untitled5/Hash_Page.dart';
import 'package:untitled5/Home_Page.dart';

import 'Encryption_Page.dart';
import 'Encryption_algos/Fernet_Page.dart';

TextEditingController key_tec = TextEditingController();

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/myhome',
      routes: {
        '/myhome' : (context) => HomePage(),
        '/encryption1' : (context) => Encryption1(),
        '/AES_page' : (context) => AES_Page(),
        '/Fernet_page' : (context) => Fernet_Page(),
        '/Salsa20_page' : (context) => Salsa20_Page(),
        '/hash' : (context) => Hash_page(),
        '/sha1_page' : (context) => SHA1_Page(),
        '/sha256_page' : (context) => SHA256_Page(),
        '/sha384_page' : (context) => SHA384_Page(),
        '/sha512_page' : (context) => SHA512_Page(),
        '/md5_page' : (context) => MD5_Page(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:async_button_builder/async_button_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(child: Text('Encode/Decode')),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: Text('Welcome to Encryption and Hash Generater Application..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue[400],
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              const Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.cyan,
                  backgroundImage: AssetImage('images/unnamed.png'),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/encryption1');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15)
                    ),
                    child: const Text('Encryption', style: TextStyle(fontSize: 20.0),),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/hash');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15)
                    ),
                    child: const Text('Hash', style: TextStyle(fontSize: 20.0),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

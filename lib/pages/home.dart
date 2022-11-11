// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controllers
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahreintController = TextEditingController();

  void calcTemperatura() {
    setState(() {
      double celsius = double.parse(celsiusController.text);
      double fahreint = celsius * 1.8 + 32;
      fahreintController.text = fahreint.toStringAsFixed(2);
    });
  }

  void clearTemperatura() {
    setState(() {
      celsiusController.text = '';
      fahreintController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 123, 72, 240),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 140, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Conversor de Temperatura',
                  style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Converta de Celsius para Fahrenheit',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: celsiusController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Entre com a temperatura em Celsius',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 32, 32, 32),
                    ),
                  ),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: fahreintController,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Temperatura em Fahrenheit',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 32, 32, 32),
                    ),
                  ),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        calcTemperatura();
                      });
                    },
                    child: Text('Converter'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 39, 89, 230),
                      onPrimary: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        clearTemperatura();
                      });
                    },
                    child: Text('Limpar'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 212, 83, 24),
                      onPrimary: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

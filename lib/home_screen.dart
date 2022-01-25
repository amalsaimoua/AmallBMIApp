// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:text_fields/result_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double height = 170;
  double weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Body Mass Index'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ),
           
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'CM',
                        style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                    Slider(
                      max: 220,
                      min: 90,
                      value: height,
                      onChanged: (val) {
                        setState(() {
                          height = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.teal,
                height: MediaQuery.of(context).size.height / 16,
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(height / 100, 2);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => resultScreen(
                                  age: age, resultt: result, isMale: isMale)));
                    },
                    child: Text(
                      'Calculate',
                      style: Theme.of(context).textTheme.headline2,
                    )))
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () => setState(() => isMale = type == 'male' ? false : true),
      child: Container(
        decoration: BoxDecoration(
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'male' ? Icons.male : Icons.female,
              size: 90,
            ),
            Text(
              type == 'male' ? 'Male' : 'Female',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    ));
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age --' : 'wieght -- ',
                  onPressed: () => setState(
                    () => type == 'weight' ? weight-- : age--,
                  ),
                  mini: true,
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                    heroTag: type == 'weight' ? 'age ++' : 'wieght ++ ',
                    onPressed: () => setState(
                          () => type == 'age' ? age++ : weight++,
                        ),
                    mini: true,
                    child: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  resultScreen({required this.age, required this.resultt, required this.isMale});
  final int age;
  final double resultt;
  final bool isMale;

  String get resultPhrase {
    String resultText = '';
    if (resultt >= 30)
      resultText = ' obese';
    else if (resultt > 25 && resultt < 30)
      resultText = ' overwhieght';
    else if (resultt >= 18.5 && resultt <= 24.9)
      resultText = ' normal';
    else
      ' thin';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result'),
      ),
      body: SafeArea(
        // كي لا يأخذ الشكل مساحات خاطئة ،، أي حسب قياس كل جهاز
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender: ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text('Result : ${resultt.toStringAsFixed(2)} ',
                  style: Theme.of(context).textTheme.headline1),
              Text('Healthness : $resultPhrase ',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                  ),
                  
              Text(
                'Age: $age',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

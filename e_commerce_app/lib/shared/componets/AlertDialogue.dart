// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
        icon: const Icon(Icons.abc),
        onPressed: () {
          
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.amber,
                title: const Text('Custom AlertDialog'),
                content:const  Text(
                    'This is a custom AlertDialog with yellow background.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:const  Text('Close'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

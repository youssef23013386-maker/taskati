import 'package:flutter/material.dart';
import 'package:taskati/core/styles/text_styles.dart';

class complete_screan extends StatefulWidget {
  const complete_screan({super.key});

  @override
  State<complete_screan> createState() => _complete_screanState();
}

class _complete_screanState extends State<complete_screan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Your Profile",style:TextStyles.headline,),
      ),
      body: Center(child: Text('profile')),

    );
  }
}
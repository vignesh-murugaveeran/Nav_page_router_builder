import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String? bodyHead;
  const DetailPage({super.key, this.bodyHead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(bodyHead ?? 'no name found!')),
    );
  }
}

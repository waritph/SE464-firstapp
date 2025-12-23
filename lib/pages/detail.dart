import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ), // ❗ ต้องมี comma
      body: ListView(
        children: const [
          Text("Details"),
        ],
      ),
    ); // ❗ ต้องมี ;
  }
}
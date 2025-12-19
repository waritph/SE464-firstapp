import 'package:flutter/material.dart';
import 'calc.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<String> mydata = [
    'Contact 1',
    'Contact 2',
    'Contact 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: ListView.builder(
        itemCount: mydata.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.contact_mail),
            title: Text(mydata[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalculatePage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
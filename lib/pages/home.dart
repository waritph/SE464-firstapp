import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          myBox(),
          const SizedBox(height: 20),
          myBox(),
          const SizedBox(height: 20),
          myBox(),
        ],
      ),
    );
  }

  Widget myBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(
            'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExaGIwZThsa3lpZ2YwcGQ3NjRsNm5pZ2c1c2NxeXA3YWMwamZ1dWgwZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/lGrxvmD7YazFS/giphy.gif',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "About Page",
            style: TextStyle(
              fontSize: 44,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "This is the about page of the app.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
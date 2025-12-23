import 'package:flutter/material.dart';
import 'package:firstapp/pages/detail.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Pages"),
      ), // ❗ ต้องมี comma
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            myBox("About 001", "1111111111", "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExaGIwZThsa3lpZ2YwcGQ3NjRsNm5pZ2c1c2NxeXA3YWMwamZ1dWgwZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/lGrxvmD7YazFS/giphy.gif"),
            const SizedBox(height: 20),
            myBox("About 002", "2222222222", "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMnBzcTByMGlseXFicjlqaHA4dWJsa3g0ZGNqczhmM2MxNm94YWF4MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/AAsj7jdrHjtp6/giphy.gif"),
            const SizedBox(height: 20),
            myBox("About 003", "3333333333", "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExZGo1eXp5NTdlajV1Nmh3ZTg1bzF0eXQ1dG9od3RiNzlrbDRzb3BmNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6Uqr0IDWkzhBu/giphy.gif"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// ✅ Widget function
  Widget myBox(String title, String subtitle , String img_url) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 150, // ❗ ต้องมี comma
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
        image:  DecorationImage(
          image: NetworkImage(img_url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height:2,),
          TextButton(
            onPressed: () {
              print("next page >>");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),

              );

            },
            child: Text("read more", style: TextStyle(color: Colors.white))
          ),
        ],
      ),
    );
  }
}
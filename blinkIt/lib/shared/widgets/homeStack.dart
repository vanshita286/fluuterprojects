import 'package:blinkit/shared/widgets/roundRectImage.dart';
import 'package:flutter/material.dart';

class HomeStack extends StatefulWidget {
  String? title;
  String? subtitle;
  String? imageUrl;
  HomeStack(
      {this.title = "Hair Oils for\nlong & thick hair",
      this.subtitle,
      this.imageUrl =
          "https://th.bing.com/th/id/OIP.1S3cpbLJSc37EjA33esKmQHaE8?pid=ImgDet&rs=1",
      super.key});

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: Stack(
        children: [
          // RoundRectImage(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // child: Image.network(
            //   "https://th.bing.com/th/id/OIP.1S3cpbLJSc37EjA33esKmQHaE8?pid=ImgDet&rs=1",
            //   fit: BoxFit.cover,
            // ),
            child: RoundRectImage(
              imagePath: widget.imageUrl,
            ),
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.052,
            top: MediaQuery.of(context).size.height * 0.02,
            child: Text(
              widget.title!,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.052,
            top: MediaQuery.of(context).size.height * 0.132,
            child: Text(
              widget.subtitle!,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.052,
            bottom: MediaQuery.of(context).size.height * 0.025,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text("Shop Now"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.amber[100]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

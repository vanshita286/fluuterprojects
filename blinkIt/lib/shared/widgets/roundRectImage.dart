import 'package:flutter/material.dart';

class RoundRectImage extends StatelessWidget {
  String? imagePath;
  String? section;
  double? wd;
  double? ht;
  double rt = 7.5;
  double lt = 7.5;
  RoundRectImage(
      {this.imagePath =
          "https://th.bing.com/th/id/OIP.1S3cpbLJSc37EjA33esKmQHaE8?pid=ImgDet&rs=1",
      this.section = "mylist",
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (section!.toLowerCase()) {
      case "mylist":
        wd = MediaQuery.of(context).size.width * 0.54;
        ht = MediaQuery.of(context).size.height;
        break;
      case "originals":
        wd = MediaQuery.of(context).size.width * 0.75;
        ht = MediaQuery.of(context).size.height;
        break;
      case "indian":
        wd = MediaQuery.of(context).size.width * 0.54;
        ht = MediaQuery.of(context).size.height;
        break;
      case "comingsoonsections":
        wd = double.infinity;
        ht = MediaQuery.of(context).size.height * 0.32;
        rt = 0;
        lt = 0;
        break;
      default:
        wd = MediaQuery.of(context).size.width;
        ht = MediaQuery.of(context).size.height;
    }

    return Padding(
      padding: EdgeInsets.only(left: lt, right: rt),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          width: wd,
          height: ht,
          // color: Colors.amber[100],
          image: NetworkImage(
            imagePath!,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

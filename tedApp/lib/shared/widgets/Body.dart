import 'package:flutter/material.dart';

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    "assets/vid1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  left: 15,
                  bottom: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'George Berkowski',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "How to build a Billion Dollar app?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 15,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                        size: 15.0,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "17:38",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    "assets/vid2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  left: 15,
                  bottom: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dandapani',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Unwavering Focus",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 15,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                        size: 15.0,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "17:03",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
              ],
            ),
          ],
        ),

        /////////////////////////////////////////////////
        // the below element should always be the last child of stack
        Container(
          height: MediaQuery.of(context).size.height * 0.075,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 197, 188, 188),
                offset: Offset(0, 6.0),
                blurRadius: 3,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.list_rounded,
                  color: Colors.grey[700],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.live_tv_rounded),
                color: Colors.grey[700],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.headphones_rounded),
                color: Colors.grey[700],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.lightbulb_sharp),
                color: Colors.grey[700],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_rounded),
                color: Colors.grey[700],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

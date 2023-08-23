import 'package:flutter/material.dart';

class navBar extends StatelessWidget implements PreferredSizeWidget {
  const navBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // maybe bottom : PreferredSize(child: , preferredSize: ) could work
      elevation: 0.0, //to remove the shadow beneath the appbar
      backgroundColor: Colors.white,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Text(
                    "TED",
                    style: TextStyle(
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Positioned(
                        child: Text(
                          "Newest",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 53,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      // shadowColor: Colors.grey[300],
    );
  }
}

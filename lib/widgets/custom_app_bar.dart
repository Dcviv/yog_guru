import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  AnimationController animationController;
  Animation colorTween, homeTween, drawerTween, yogaTween, iconTween;
  Function()? onPressed;
  CustomAppBar({
    required this.animationController,
    required this.drawerTween,
    required this.colorTween,
    required this.homeTween,
    required this.iconTween,
    required this.onPressed,
    required this.yogaTween,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => AppBar(
                leading: IconButton(
                  icon: Icon(Icons.dehaze, color: drawerTween.value),
                  onPressed: onPressed,
                ),
                backgroundColor: colorTween.value,
                elevation: 0,
                title: Row(
                  children: [
                    Text(
                      "Yoga",
                      style: TextStyle(
                          color: homeTween.value,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      "pedia",
                      style: TextStyle(
                          color: yogaTween.value,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ],
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    color: iconTween.value,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("No New Notifications"),
                        duration: Duration(seconds: 1),
                      ));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )),
    );
  }
}

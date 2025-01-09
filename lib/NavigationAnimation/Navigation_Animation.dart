import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class NavigationAnimation {
  static PageRouteBuilder NavigatorAnimationPush(Widget navigatorPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => navigatorPage,
      transitionDuration: Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        /// Slide transition from the right
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
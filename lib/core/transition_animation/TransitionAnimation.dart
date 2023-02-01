import 'package:flutter/material.dart';

class AnimationTransitionClass {

  static Route createRouteAnimation(dynamic page , {TextDirection? textDirection , bool isSlide = true}) {
    return PageRouteBuilder(
        transitionDuration:  Duration(milliseconds:isSlide ? 500 : 30),
        pageBuilder: (context, animation, secondaryAnimation) => page,

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin =   Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeOut;
          final tween = Tween(begin: begin, end: end ,);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );
          return isSlide ? SlideTransition(
            position: tween.animate(curvedAnimation),
            textDirection:textDirection ?? TextDirection.ltr,

            child: child,
          ) : FadeTransition(
            opacity: animation,
            child: child,
          );
        }
    );
  }

}
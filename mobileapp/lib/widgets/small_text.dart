import 'package:flutter/cupertino.dart';
// import 'package:mobileapp/utils/dimensions.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({super.key, this.color=const Color(0xFFccc7c5), required this.text,
  this.height=1.2, this.size=12
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size,
        height: height
      ),
    );
  }
}
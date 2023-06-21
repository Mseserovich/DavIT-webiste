import 'package:flutter/material.dart';
import 'package:mobileapp/utils/dimensions.dart';
import 'package:mobileapp/widgets/small_text.dart';
  
class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({super.key,
    required this.icon,
    required this.text,
    required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,size: Dimensions.iconSize24,),
        SizedBox(width: Dimensions.width5,),
        SmallText(text: text)
      ],
    );
  }
}
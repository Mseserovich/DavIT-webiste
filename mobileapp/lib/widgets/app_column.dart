import 'package:flutter/material.dart';
import 'package:mobileapp/widgets/big_text.dart';
import 'package:mobileapp/widgets/icon_and_text.dart';
import 'package:mobileapp/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: text, size: Dimensions.font26,),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: AppColors.mainColor,size: 15,);
                          }),
                        ),
                        SizedBox(width: Dimensions.width10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimensions.width10,),
                        SmallText(text: "1287"),
                        SizedBox(width: Dimensions.width5,),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.iconColor1
                        ),
                        SizedBox(width: Dimensions.width10,),
                        IconAndTextWidget(icon: Icons.location_on,
                        text: "1.7km",
                        iconColor: AppColors.mainColor
                        ),
                        SizedBox(width: Dimensions.width10,),
                        IconAndTextWidget(icon: Icons.access_time_rounded,
                        text: "32min",
                        iconColor: AppColors.iconColor2
                        )
                      ],
                    )
                  ],
                ),
    );
  }
}
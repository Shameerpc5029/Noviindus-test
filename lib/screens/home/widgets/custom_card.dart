import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.cardColor,
  });

  final String title;
  final String subTitle;
  final String image;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * .22,
          width: MediaQuery.of(context).size.width / 2.4,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: AppColor.white,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColor.white,
                ),
              ),
            ],
          ),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage(image),
        )
      ],
    );
  }
}

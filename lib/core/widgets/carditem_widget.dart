import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const CardItemWidget({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          height: 70,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

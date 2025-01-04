import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? text;
  final double top;
  const CustomAppbar({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.text,
    required this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: top,
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 28,
                  )
                : const SizedBox(),
            text != null
                ? Text(
                    text!,
                    style: AppTypography.s18w7c853,
                  )
                : const Text(''),
            suffixIcon != null
                ? Icon(
                    suffixIcon,
                    size: 28,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, top + 40);
}

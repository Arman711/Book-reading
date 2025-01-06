import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? text;
  final double top;
  const CustomAppBar({
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
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(child: prefixIcon),
            text != null
                ? Text(
                    text!,
                    style: AppTypography.s18w7c853,
                  )
                : const Text(''),
            SizedBox(
              height: 20,
              width: 18,
              child: suffixIcon,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, top + 56);
}

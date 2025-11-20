import 'package:flutter/material.dart';

/// Reusable calculator button widget.
/// - label: chữ hiển thị
/// - onTap: callback khi nhấn
/// - bgColor, textColor, fontSize configurable
class CalcButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final double fontSize;

  const CalcButton({
    super.key,
    required this.label,
    required this.onTap,
    this.bgColor = const Color(0xFF4F5D75),
    this.textColor = Colors.white,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8), // margin leads to ~16px spacing between buttons
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

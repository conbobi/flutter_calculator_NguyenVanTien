import 'package:flutter/material.dart';

class DisplayPanel extends StatelessWidget {
  final String equation;
  final String display;

  const DisplayPanel({
    super.key,
    required this.equation,
    required this.display,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Equation text – small line
          if (equation.isNotEmpty)
            Text(
              equation,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 18,          // yêu cầu: 18px
                color: Colors.white70, // màu nhạt hơn
              ),
            ),

          const SizedBox(height: 8),

          // Display text – main result
          SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Text(
              display,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 24,          // yêu cầu: 24px
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

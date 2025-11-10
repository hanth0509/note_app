import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final int selectedColor;
  final Function(int) onColorSelected;

  const ColorPicker({
    Key? key,
    required this.selectedColor,
    required this.onColorSelected,
  }) : super(key: key);

  final List<int> _colors = const [
    0xFFF8BBD0, // Pink
    0xFFBBDEFB, // Blue
    0xFFC8E6C9, // Green
    0xFFFFF9C4, // Yellow
    0xFFE1BEE7, // Purple
    0xFFFFCCBC, // Orange
    0xFFB2EBF2, // Cyan
    0xFFDCEDC8, // Light Green
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _colors.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final color = _colors[index];
          return GestureDetector(
            onTap: () => onColorSelected(color),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(color),
                shape: BoxShape.circle,
                border: selectedColor == color
                    ? Border.all(color: Colors.black, width: 3)
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
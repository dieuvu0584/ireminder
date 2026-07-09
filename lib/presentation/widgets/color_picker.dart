import 'package:flutter/material.dart';

/// 16 standard Material palette swatches, stored/read as "#RRGGBB".
const List<String> kCategoryColorPalette = [
  '#EF4444',
  '#F97316',
  '#F59E0B',
  '#EAB308',
  '#84CC16',
  '#22C55E',
  '#10B981',
  '#14B8A6',
  '#06B6D4',
  '#3B82F6',
  '#6366F1',
  '#8B5CF6',
  '#A855F7',
  '#D946EF',
  '#EC4899',
  '#78716C',
];

Color parseHexColor(String hex) {
  final cleaned = hex.replaceFirst('#', '');
  return Color(int.parse('FF$cleaned', radix: 16));
}

class ColorPicker extends StatelessWidget {
  final String selectedHex;
  final ValueChanged<String> onSelected;

  const ColorPicker({
    super.key,
    required this.selectedHex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: kCategoryColorPalette.map((hex) {
        final selected = hex.toUpperCase() == selectedHex.toUpperCase();
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => onSelected(hex),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: parseHexColor(hex),
              shape: BoxShape.circle,
              border: selected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 3,
                    )
                  : null,
            ),
            child: selected
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../data/database/app_database.dart';
import 'color_picker.dart';
import 'icon_catalog.dart';

class CategoryChip extends StatelessWidget {
  final Category category;
  final bool selected;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.category,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = parseHexColor(category.color);
    return ChoiceChip(
      selected: selected,
      onSelected: onTap == null ? null : (_) => onTap!(),
      avatar: Icon(resolveCategoryIcon(category.icon), size: 18, color: color),
      label: Text(category.name),
      selectedColor: color.withValues(alpha: 0.2),
      side: BorderSide(color: color.withValues(alpha: 0.4)),
    );
  }
}

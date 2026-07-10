import 'package:flutter/material.dart';

import 'icon_catalog.dart';

class IconPicker extends StatelessWidget {
  final String selectedKey;
  final ValueChanged<String> onSelected;

  const IconPicker({
    super.key,
    required this.selectedKey,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: kIconCatalog.length,
      itemBuilder: (context, index) {
        final entry = kIconCatalog.entries.elementAt(index);
        final selected = entry.key == selectedKey;
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onSelected(entry.key),
          child: Container(
            decoration: BoxDecoration(
              color: selected
                  ? scheme.primaryContainer
                  : scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: selected
                  ? Border.all(color: scheme.primary, width: 2)
                  : null,
            ),
            child: Icon(
              entry.value,
              color: selected ? scheme.onPrimaryContainer : scheme.onSurface,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../data/database/app_database.dart';
import '../../providers/category_providers.dart';
import '../../widgets/color_picker.dart';
import '../../widgets/icon_picker.dart';
import '../../widgets/save_action_button.dart';

class CategoryFormScreen extends ConsumerStatefulWidget {
  final Category? existing;

  const CategoryFormScreen({super.key, this.existing});

  @override
  ConsumerState<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends ConsumerState<CategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late String _icon;
  late String _color;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final c = widget.existing;
    _nameCtrl = TextEditingController(text: c?.name ?? '');
    _icon = c?.icon ?? 'star';
    _color = c?.color ?? '#3B82F6';
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final actions = ref.read(categoryActionsProvider);
    try {
      if (widget.existing == null) {
        await actions.create(
          name: _nameCtrl.text.trim(),
          icon: _icon,
          color: _color,
        );
      } else {
        await actions.update(
          widget.existing!.copyWith(
            name: _nameCtrl.text.trim(),
            icon: _icon,
            color: _color,
          ),
        );
      }
      if (mounted) Navigator.of(context).pop();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.existing == null
              ? l10n.categoryFormTitleNew
              : l10n.categoryFormTitleEdit,
        ),
        actions: [
          SaveActionButton(
            label: l10n.actionSave,
            onPressed: _saving ? null : _submit,
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(labelText: l10n.categoryFieldName),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? l10n.categoryFieldNameRequired
                    : null,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.categoryFieldColor,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              ColorPicker(
                selectedHex: _color,
                onSelected: (hex) => setState(() => _color = hex),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.categoryFieldIcon,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              IconPicker(
                selectedKey: _icon,
                onSelected: (key) => setState(() => _icon = key),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

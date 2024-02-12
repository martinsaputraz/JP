import 'package:flutter/material.dart';

class ChangeLanguageTile extends StatelessWidget {
  final String language;
  final String iconPath;
  final String? selectedLanguage;
  final Function(String) onTap;

  const ChangeLanguageTile({
    super.key,
    required this.language,
    required this.iconPath,
    required this.selectedLanguage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedLanguage == language;

    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
      title: Text(language),
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : null,
      tileColor: isSelected ? Colors.green.withOpacity(0.3) : null,
      onTap: () {
        onTap(language);
        Navigator.pop(context);
      },
    );
  }
}

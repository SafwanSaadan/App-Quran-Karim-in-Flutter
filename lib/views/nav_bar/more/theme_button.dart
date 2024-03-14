import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/provider/theme_provider.dart';


/// da el button about change theme
class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Switch.adaptive(
      activeColor: themeProvider.getTheme == darkTheme
          ? ColorManager.orangeColor
          : ColorManager.grey,
      value: themeProvider.getTheme == darkTheme,
      onChanged: (value) {
        themeProvider.changeTheme();
        setState(() {});
      },
    );
  }
}

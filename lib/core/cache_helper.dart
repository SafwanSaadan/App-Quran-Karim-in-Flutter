import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

int bookmarkedAyah = 1;
int bookmarkedSura = 1;
bool fabIsClicked = true;

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

String arabicFont = 'quran';
double arabicFontSize = 28;

bool view = true;

Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = prefs.getInt('arabicFontSize')!.toDouble();
  } catch (_) {
    arabicFontSize = 28;
  }
}

saveBookMark(surah, ayah) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("surah", surah);
  await prefs.setInt("ayah", ayah);
}

readBookmark() async {
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}

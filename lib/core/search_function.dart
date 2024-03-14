// import 'dart:convert';

// List<Ayat> ayatOfSearch2 = [];

// Future<void> search(String query) async {
//   final String response =
//   await rootBundle.loadString("assets/hafs_smart_v8.json");
//   final data = await json.decode(response);
//   final ayat = data["quran"];
//   List<Ayat> ayatOfSearch = [];
//   for (int i = 0; i < ayat.length; i++) {
//     if (ayat[i]["aya_text_emlaey"].toString().contains(query)) {
//       ayatOfSearch.add(Ayat.fromJson(ayat[i]));
//     }
//   }
//   setState(() {
//     ayatOfSearch2 = ayatOfSearch;
//   });
// }
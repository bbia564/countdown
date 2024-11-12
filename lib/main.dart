import 'package:autograph_album/db_album/db_album.dart';
import 'package:autograph_album/pages/album_first/album_first_binding.dart';
import 'package:autograph_album/pages/album_first/album_first_view.dart';
import 'package:autograph_album/pages/album_first/date_add/date_add_binding.dart';
import 'package:autograph_album/pages/album_first/date_add/date_add_view.dart';
import 'package:autograph_album/pages/album_first/date_love/date_love_binding.dart';
import 'package:autograph_album/pages/album_first/date_love/date_love_view.dart';
import 'package:autograph_album/pages/album_second/album_add/album_add_binding.dart';
import 'package:autograph_album/pages/album_second/album_add/album_add_view.dart';
import 'package:autograph_album/pages/album_second/album_second_binding.dart';
import 'package:autograph_album/pages/album_second/album_second_view.dart';
import 'package:autograph_album/pages/album_tab/album_tab_binding.dart';
import 'package:autograph_album/pages/album_tab/album_tab_view.dart';
import 'package:autograph_album/pages/album_third/album_third_binding.dart';
import 'package:autograph_album/pages/album_third/album_third_view.dart';
import 'package:autograph_album/pages/album_third/feedback/feedback_binding.dart';
import 'package:autograph_album/pages/album_third/feedback/feedback_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'db_album/date_computed.dart';

Color primaryColor = const Color(0xfff5902c);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBAlbum().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pers,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Pers = [
  GetPage(name: '/', page: ()  => const DateLoveView(), binding: DateLoveBinding()),
  GetPage(name: '/album_tab', page: ()  => AlbumTabPage(), binding: AlbumTabBinding()),
  GetPage(name: '/album_first', page: () => AlbumFirstPage(), binding: AlbumFirstBinding()),
  GetPage(name: '/album_second', page: () => AlbumSecondPage(), binding: AlbumSecondBinding()),
  GetPage(name: '/album_third', page: () => AlbumThirdPage(), binding: AlbumThirdBinding()),
  GetPage(name: '/rule_back', page: () => const DateComputed()),
  GetPage(name: '/feedback', page: () => FeedbackPage(), binding: FeedbackBinding()),
  GetPage(name: '/album_add', page: () => AlbumAddPage(), binding: AlbumAddBinding()),
  GetPage(name: '/date_add', page: () => DateAddPage(), binding:  DateAddBinding())
];


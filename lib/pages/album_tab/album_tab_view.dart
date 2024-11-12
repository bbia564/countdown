import 'package:autograph_album/pages/album_first/album_first_view.dart';
import 'package:autograph_album/pages/album_second/album_second_view.dart';
import 'package:autograph_album/pages/album_third/album_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../album_first/album_first_logic.dart';
import '../album_second/album_second_logic.dart';
import 'album_tab_logic.dart';

class AlbumTabPage extends GetView<AlbumTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          AlbumFirstPage(),
          AlbumSecondPage(),
          AlbumThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navAlBars()),
    );
  }

  Widget _navAlBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/icon0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/icon1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon2Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/icon2Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Mine',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
        if (index == 0) {
          AlbumFirstLogic firstLogic = Get.put(AlbumFirstLogic());
          firstLogic.getData();
        } else if (index == 1) {
          AlbumSecondLogic secondLogic = Get.put(AlbumSecondLogic());
          secondLogic.getData();
        }
      },
    );
  }
}

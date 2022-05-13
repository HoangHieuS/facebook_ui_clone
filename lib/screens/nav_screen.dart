import 'dart:io';

import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/data/data.dart';
import 'package:facebook_ui_clone/screens/screens.dart';
import 'package:facebook_ui_clone/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    MdiIcons.accountMultiple,
    MdiIcons.accountCircleOutline,
    MdiIcons.newspaperVariantOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  final List<IconData> _desktopIcons = const [
    Icons.home,
    MdiIcons.accountMultiple,
    Icons.ondemand_video,
    MdiIcons.storefrontOutline,
    MdiIcons.facebookGaming,
    MdiIcons.newspaperVariantOutline,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final isDesktop = Responsive.isDesktop(context);
    return isDesktop
        ? DefaultTabController(
            length: _icons.length,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color(0XFF4C4B4F),
                child: const Icon(MdiIcons.squareEditOutline),
              ),
              appBar: PreferredSize(
                preferredSize: Size(screenSize.width, 100),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icon: _desktopIcons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              ),
              body: IndexedStack(
                index: _selectedIndex,
                children: _screens,
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              ),
            ),
          )
        : DefaultTabController(
            length: _icons.length,
            child: Scaffold(
              appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light),
                backgroundColor: Colors.white,
                title: const Text(
                  'facebook',
                  style: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                centerTitle: false,
                actions: const [
                  CircleButton(
                    icon: Icons.search,
                    iconSize: 30,
                  ),
                  CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30,
                  ),
                ],
                elevation: 0,
              ),
              body: Column(
                children: [
                  !kIsWeb && Platform.isAndroid
                      ? Container(
                          padding: const EdgeInsets.only(left: 5),
                          color: Colors.white,
                          child: CustomTabBar(
                            isBottomIndicator: true,
                            icons: _icons,
                            selectedIndex: _selectedIndex,
                            onTap: (index) =>
                                setState(() => _selectedIndex = index),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Expanded(
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: _screens,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: !kIsWeb && Platform.isIOS
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: CustomTabBar(
                        icons: _icons,
                        selectedIndex: _selectedIndex,
                        onTap: (index) =>
                            setState(() => _selectedIndex = index),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
  }
}

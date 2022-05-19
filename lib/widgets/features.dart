import 'package:facebook_ui_clone/data/data.dart';
import 'package:facebook_ui_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Features extends StatefulWidget {
  const Features({Key? key}) : super(key: key);

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final List<Widget> _features = [
    Stories(
      currentUser: currentUser,
      stories: stories,
    ),
    ShortVideos(stories: stories),
    const Rooms(onlineUsers: onlineUsers),
  ];

  final List<String> _labels = const ['Stories', 'Short Video', 'Rooms'];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _labels.length,
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 5),
              color: Colors.white,
              child: CustomFeatureBar(
                label: _labels,
                selectedIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: _features,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

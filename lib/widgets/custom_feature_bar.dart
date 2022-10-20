import 'package:flutter/material.dart';

class CustomFeatureBar extends StatelessWidget {
  final List<String> label;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomFeatureBar({
    Key? key,
    required this.label,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: const Color.fromARGB(255, 16, 78, 128),
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 19, 103, 172),
            width: 3,
          ),
        ),
      ),
      tabs: label
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(text: e),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/models/models.dart';
import 'package:facebook_ui_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(60, 110, 107, 107),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: 'What\'s on your mind?',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: isDesktop ? 15 : 10,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                !isDesktop
                    ? const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const Divider(height: 10, thickness: 0.5),
            SizedBox(
              height: 40,
              child: isDesktop
                  ? IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.videocam,
                              color: Colors.red,
                            ),
                            label: const Text('Live'),
                          ),
                          const VerticalDivider(thickness: 1),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.photo_library,
                              color: Colors.green,
                            ),
                            label: const Text('Photo'),
                          ),
                          const VerticalDivider(thickness: 1),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.orange,
                            ),
                            label: const Text('Emotion'),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          RoundedButton(
                            icon: MdiIcons.moviePlay,
                            label: 'Short\nVideo',
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(width: 10),
                          RoundedButton(
                            icon: Icons.video_call,
                            label: 'Room',
                            color: Colors.purple,
                          ),
                          SizedBox(width: 10),
                          RoundedButton(
                            icon: MdiIcons.accountGroup,
                            label: 'Group',
                            color: Palette.facebookBlue,
                          ),
                          SizedBox(width: 10),
                          RoundedButton(
                            icon: Icons.videocam,
                            label: 'Live',
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}


//Movies: pink, room: purple, group: blue, Live: red

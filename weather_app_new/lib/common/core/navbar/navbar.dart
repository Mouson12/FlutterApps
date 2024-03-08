/*import 'package:flutter/material.dart';
import 'package:animated_icons/animated_icons.dart';

const Color bottonNavBgColor = Color(0xFF17203A);

class BottonNavWithAnimatedIcons extends StatefulWidget {
  const BottonNavWithAnimatedIcons({Key? key}) : super(key: key);

  @override
  State<BottonNavWithAnimatedIcons> createState() =>
      _BottonNavWithAnimatedIconsState();
}

class _BottonNavWithAnimatedIconsState
    extends State<BottonNavWithAnimatedIcons> {
  int _currentIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 56, //TODO: In Future remove the height
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: bottonNavBgColor.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: bottonNavBgColor.withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, AnimatedIcons.menu_close),
              _buildNavItem(1, AnimatedIcons.menu_home),
              _buildNavItem(2, AnimatedIcons.view_list),
            ],
          ),
        ),
      ),
    );
  }

  /*Widget _buildNavItem(int index, AnimatedIconData icon) {
    return IconButton(
      icon: AnimatedIcon(
        icon: icon,
        progress: _getIconAnimationProgress(index),
      ),
      onPressed: () {
        _onNavItemTapped(index);
      },
    );
  }*/

  double _getIconAnimationProgress(int index) {
    return _currentIndex == index ? 1.0 : 0.0;
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // TODO: Handle the tap action for each tab
    });
  }
}*/

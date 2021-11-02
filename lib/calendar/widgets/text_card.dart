import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class TextCard extends StatelessWidget {
  const TextCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenRatio.absoluteWidth,
      height: ScreenRatio.absoluteHeight * 0.35,
      padding: const EdgeInsets.all(30),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(1, 5),
          ),
        ],
      ),
      child: const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/base_screen_provider.dart';

class ModalBaseScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!BaseScreenProvider.of(context).openModal) {
      return Container();
    }

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: BaseScreenProvider.of(context).contentModal,
        ),
      ],
    );
  }
}

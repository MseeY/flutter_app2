import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/ui/screens/wighets/dialog/info_dialog.dart';
import 'package:flutter_app2/ui/screens/wighets/dialog/loading_dialog.dart';


class DialogUtils {
  static DialogUtils instance = DialogUtils();

  void showInfo(
      BuildContext context, String message, IconData icon, String buttonText,
      {Function? onClick}) {
    showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(
        barrierDismissible: false
      ),
      builder: (context) {
        return InfoDialog(
          text: message,
          onClickOK: () =>
              onClick != null ? onClick() : Navigator.pop(context),
          icon: icon,
          clickText: buttonText,
        );
      });
  }

  void showChoose(
      BuildContext context, String message, IconData icon, String buttonText,
      {Function? onClick}) {
    showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(
        barrierDismissible: false
      ),
      builder: (context) {
        return InfoDialog(
          text: message,
          onClickOK: () =>
              onClick != null ? onClick() : Navigator.pop(context),
          icon: icon,
          onClickCancel: () => Navigator.pop(context),
          clickText: buttonText,
        );
      });
  }

  void showLoading(BuildContext context, String message) {
    showModal(
        context: context,
        configuration: FadeScaleTransitionConfiguration(
          barrierDismissible: false
        ),
        builder: (context) {
          return LoadingDialog(
            text: message,
          );
        });
  }
}

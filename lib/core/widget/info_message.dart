// Flutter imports:
import 'package:flutter/material.dart';

class InfoMessage {
  MessageStatus status;
  String? title;
  String? message;
  SnackBarDuration duration;

  InfoMessage(
      {this.status = MessageStatus.success,
      this.title,
      this.message,
      this.duration = SnackBarDuration.long});

  void snack(BuildContext context, {SnackBarAction? action}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(
              _getIcon(status),
              color: Colors.white,
              size: 36,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (title != null)
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.white),
                        child: Text(
                          title!,
                        ),
                      ),
                    if (message != null)
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white),
                        child: Text(
                          message.toString().trim(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: _getColor(status),
        duration: _getTime(duration),
        action: action,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
  }

  IconData _getIcon(MessageStatus s) {
    switch (s) {
      case MessageStatus.success:
        return Icons.info;
      case MessageStatus.error:
        return Icons.error;
      case MessageStatus.info:
        return Icons.info;
      case MessageStatus.warning:
        return Icons.warning;
      default:
        return Icons.info;
    }
  }

  Color _getColor(MessageStatus s) {
    switch (s) {
      case MessageStatus.success:
        return Colors.green;
      case MessageStatus.error:
        return Colors.red;
      case MessageStatus.info:
        return Colors.blue;
      case MessageStatus.warning:
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }

  Duration _getTime(SnackBarDuration s) {
    switch (s) {
      case SnackBarDuration.indefinite:
        return const Duration(minutes: 1);
      case SnackBarDuration.long:
        return const Duration(milliseconds: 2750);
      default:
        return const Duration(milliseconds: 1500);
    }
  }
}

enum MessageStatus { success, error, info, warning }

enum SnackBarDuration { indefinite, long, short }

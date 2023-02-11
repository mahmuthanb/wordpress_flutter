// Flutter imports:
import 'package:flutter/material.dart';
import 'package:wordpress_flutter/core/res/colors.dart';

class AppDialog extends StatelessWidget {
  final Widget? title;
  final Widget? subTitle;
  final Widget? icon;
  final List<Widget>? actions;
  const AppDialog(
      {Key? key, this.title, this.subTitle, this.actions, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: icon,
                ),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    child: title!,
                  ),
                ),
              if (subTitle != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyText2!,
                    textAlign: TextAlign.center,
                    child: subTitle!,
                  ),
                ),
              if (actions != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: actions!
                        .map((e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Divider(
                                  height: 0,
                                  color: AppColors.lightGrey,
                                ),
                                e,
                              ],
                            ))
                        .toList(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

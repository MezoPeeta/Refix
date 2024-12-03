import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(
          child: Divider(
        thickness: 2,
      )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x),
        child: Text(name),
      ),
      const Expanded(
          child: Divider(
        thickness: 2,
      )),
    ]);
  }
}

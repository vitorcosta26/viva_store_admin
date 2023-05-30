import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleDashItem extends StatelessWidget {
  final String title, subtitle;
  final void Function()? onPresed;
  const SingleDashItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPresed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPresed,
      child: Card(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 35),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

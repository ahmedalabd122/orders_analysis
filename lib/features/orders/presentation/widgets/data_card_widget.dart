import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.accents[6],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 32,
                  overflow: TextOverflow.fade,
                  locale: context.locale,
                ),
                maxLines: 1,
              ),
              Text(
                title,
              )
            ],
          ),
        ),
      ),
    );
  }
}

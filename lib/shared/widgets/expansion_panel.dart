import 'package:flutter/material.dart';

class ExpandablePanel extends StatelessWidget {
  const ExpandablePanel({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List<ExpandableModel> items;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF222222),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          expandedAlignment: Alignment.centerLeft,
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
              ),
              child: const SizedBox(
                height: 1.0,
              ),
            ),
            ...items.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Text(
                    e.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
          ],
        ));
  }
}

class ExpandableModel {
  const ExpandableModel({
    required this.title,
  });

  final String title;
}

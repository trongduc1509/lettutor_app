import 'dart:ui';

import 'package:flutter/material.dart';

import '../../base/define/style/default_style.dart';
import '../../base/theme/colors.dart';
import 'common_assets.dart';

class BottomIndicatorBar extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final bool shadow;
  final int currentIndex;
  final double width;
  final ValueChanged<int> onTap;
  final List<BottomIndicatorNavigationBarItem> items;

  const BottomIndicatorBar(
      {Key? key,
      required this.onTap,
      required this.items,
      this.activeColor = Colors.teal,
      this.inactiveColor = Colors.grey,
      this.shadow = true,
      this.currentIndex = 0,
      this.width = 0})
      : super(key: key);

  @override
  State createState() => _BottomIndicatorBarState();
}

class _BottomIndicatorBarState extends State<BottomIndicatorBar> {
  static const double BAR_HEIGHT = 65;
  static const double INDICATOR_HEIGHT = 2;

  List<BottomIndicatorNavigationBarItem> get items => widget.items;

  Duration duration = const Duration(milliseconds: 170);

  double? _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BAR_HEIGHT + MediaQuery.of(context).viewPadding.bottom,
      width: widget.width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: widget.shadow
            ? [
                const BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: INDICATOR_HEIGHT,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index, item),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: widget.width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex)!, 0),
              curve: Curves.linear,
              duration: duration,
              child: Container(
                color: widget.activeColor,
                width: widget.width / items.length,
                height: INDICATOR_HEIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _select(int index, BottomIndicatorNavigationBarItem item) {
    widget.onTap(index);
  }

  Widget _setIcon(BottomIndicatorNavigationBarItem item, bool isSelect) {
    return Column(
      children: [
        item.iconName != null
            ? AssetCommon(
                name: item.iconName!,
                color: isSelect ? widget.activeColor : widget.inactiveColor,
                size: 24,
              )
            : Icon(
                item.availableIcon,
                color: isSelect ? widget.activeColor : widget.inactiveColor,
                size: 24,
              ),
        const SizedBox(
          height: 6,
        ),
        FittedBox(
          child: Text(
            item.title,
            style: DefaultStyle().t12Medium.apply(
                color: isSelect ? widget.activeColor : widget.inactiveColor),
            // maxLines: 1,
          ),
        )
      ],
    );
  }

  Widget _buildItemWidget(
      BottomIndicatorNavigationBarItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      height: BAR_HEIGHT,
      width: widget.width / items.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _setIcon(item, isSelected),
        ],
      ),
    );
  }
}

class BottomIndicatorNavigationBarItem {
  BottomIndicatorNavigationBarItem({
    required this.title,
    this.iconName,
    this.availableIcon,
    this.backgroundColor = Colors.white,
  });
  String? iconName;
  IconData? availableIcon;
  final String title;
  final Color backgroundColor;
}

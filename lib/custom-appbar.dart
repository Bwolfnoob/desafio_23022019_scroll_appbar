import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final String title;
  MaterialColor color;

  CustomAppbar({
    Key key,
    this.scrollController,
    this.color,
    this.title,
  }) : super(key: key) {
    this.color = color ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              int current = scrollController?.offset?.round() ?? 0;
              int maxSize =
                  ((scrollController?.position?.maxScrollExtent ?? 1) - current)
                      .round();
              return Row(
                children: <Widget>[
                  Expanded(
                    flex: current,
                    child: Container(
                      color: color,
                    ),
                  ),
                  Expanded(
                    flex: maxSize,
                    child: Container(
                      color: color.shade800,
                    ),
                  ),
                ],
              );
            },
          ),
          Text(title ?? ""),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

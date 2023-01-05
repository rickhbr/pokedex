import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';

class StatusBar extends StatefulWidget {
  final Color color;
  final String text;
  final double percent;
  final double width;
  const StatusBar({
    super.key,
    required this.color,
    required this.percent,
    required this.text,
    required this.width,
  });

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    const Color background = Colors.white;
    final Color fill = widget.color;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    double fillPercent = widget.percent;
    double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: HBox(
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ThemeAPP.colors.primaryText,
            ),
          ),
          SizedBox(
            width: widget.width,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(2.0),
              ),
              gradient: LinearGradient(
                colors: gradient,
                stops: stops,
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TypeCard extends StatefulWidget {
  final String? text;
  final Color? color;
  const TypeCard({super.key, required this.text, required this.color});

  @override
  State<TypeCard> createState() => _TypeCardState();
}

class _TypeCardState extends State<TypeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 24,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Center(
        child: Text(
          widget.text!,
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

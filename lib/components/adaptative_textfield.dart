import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TextField adaptativo para alterar quando estiver o IOS e quando estiver no Android
class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;
  final String label;
  final TextInputType keyboardType;

  AdaptativeTextField({
    this.controller,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: (_) => onSubmitted(),
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: (_) => onSubmitted(),
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}

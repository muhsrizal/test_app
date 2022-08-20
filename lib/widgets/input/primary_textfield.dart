import 'package:flutter/material.dart';

import '../../theme/palette.dart';

class PrimaryTextfield extends StatelessWidget {
  const PrimaryTextfield({
    Key? key,
    this.controller,
    this.hint,
    this.onClear,
    this.label,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.autovalidateModel,
    this.enabled,
    this.filled,
    this.prefixIcon,
    this.fillColor,
    this.maxLines,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final void Function()? onClear;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final AutovalidateMode? autovalidateModel;
  final bool? enabled;
  final bool? filled;
  final Widget? prefixIcon;
  final Color? fillColor;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: textTheme.headline6?.copyWith(
              color: palette.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 8),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(8),
          child: TextFormField(
            enabled: enabled,
            key: key,
            maxLines: maxLines ?? 1,
            autovalidateMode: autovalidateModel,
            validator: validator,
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(minWidth: 32),
              prefixIcon: prefixIcon,
              fillColor: fillColor ?? palette.lightGrey,
              filled: filled,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    filled != null ? BorderSide.none : const BorderSide(),
              ),
              suffixIcon: onClear != null
                  ? IconButton(
                      onPressed: onClear,
                      icon: const Icon(Icons.clear),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

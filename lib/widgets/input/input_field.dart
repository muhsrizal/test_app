import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.initialValue,
    this.passwordField = false,
    this.filled = false,
    this.color,
    this.inputedTextColor,
    this.prefixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool passwordField;
  final bool filled;
  final Color? color;
  final Color? inputedTextColor;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isPasswordShow = false;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: widget.filled
          ? BorderSide.none
          : widget.color != null
              ? BorderSide(color: widget.color!)
              : const BorderSide(),
    );

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      obscureText: widget.passwordField && !_isPasswordShow,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      style: TextStyle(color: widget.inputedTextColor),
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: widget.color,
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: TextStyle(color: widget.color),
        contentPadding: const EdgeInsets.all(16),
        border: border,
        enabledBorder: border,
        prefixIcon: widget.prefixIcon != null
            ? IconTheme(
                data: IconThemeData(color: widget.color),
                child: widget.prefixIcon!,
              )
            : null,
        suffixIcon: widget.passwordField
            ? _PasswordIconButton(
                color: widget.color,
                isPasswordShow: _isPasswordShow,
                onPressed: () =>
                    setState(() => _isPasswordShow = !_isPasswordShow),
              )
            : null,
      ),
    );
  }
}

class _PasswordIconButton extends StatelessWidget {
  const _PasswordIconButton({
    Key? key,
    this.color,
    required this.isPasswordShow,
    this.onPressed,
  }) : super(key: key);

  final Color? color;
  final bool isPasswordShow;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isPasswordShow ? Icons.visibility_off : Icons.visibility,
        color: color,
      ),
    );
  }
}

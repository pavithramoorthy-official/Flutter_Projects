import 'package:flutter/material.dart';

import '../core/styles/colorscheme/colors/app_colors.dart';

class UiTextformfield extends StatefulWidget {
  const UiTextformfield({super.key,
  required this.controller,
    this.validator,
    this.onChanged,
    this.width,
    this.keyboardType,
    this.hideText,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final double? width;
  final TextInputType? keyboardType;
  final bool? hideText;

  @override
  State<UiTextformfield> createState() => _UiTextformfieldState();
}

class _UiTextformfieldState extends State<UiTextformfield> {
  final FocusNode _focusNode = FocusNode();
  bool _hasError = false;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener((){
      if(_focusNode.hasFocus){
        setState(() {
          _hasError = false;
        });
      }
    });
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    widget.controller.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(

        obscureText: widget.hideText ?? false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            _hasError = false; // Remove error when user types
          });
        },
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: DefaultColors.gray_0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:  _hasError ? DefaultColors.red_2 : DefaultColors.purple_8,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: DefaultColors.purple_8,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:  DefaultColors.purple_8,
            ),
          ),
        ),
      ),
    );
  }
}

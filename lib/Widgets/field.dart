import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatefulWidget {
  final int? containerDuration;
  final double? containerOpacity;
  final double? containerWidth;
  final String? hintText;
  final TextEditingController? controller;
  final String? icon;
  final Duration durationAnimation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool? obscureText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLen;
  const TextFormFieldWidget(
      {super.key,
      this.containerDuration,
      this.containerOpacity,
      this.containerWidth,
      this.controller,
      this.icon,
      this.hintText, 
      required this.durationAnimation, 
      this.margin, 
      this.padding, this.obscureText, this.onChanged, this.keyboardType, this.maxLen});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  FocusNode focusNode = FocusNode();
    bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        onFocusChange();
      }); 
    });
  }


    @override
      void dispose() {
        focusNode.removeListener(() { 
          setState(() {
            onFocusChange();
          });
        });
    focusNode.dispose(); 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
      duration: Duration(milliseconds: widget.containerDuration ?? 0),
      opacity: widget.containerOpacity ?? 0,
      child: AnimatedContainer(
        duration: widget.durationAnimation,
        curve: Curves.easeInOut,
        margin: widget.margin ?? const EdgeInsets.only(top: 20),
        padding: widget.padding ?? const EdgeInsets.only(left: 30),
        width: widget.containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(width: 0.5, color: Colors.grey),
          color: _getBackgroundColor(),
          boxShadow: _getBoxShadow(),
        ),
        child: TextFormField(
          maxLength: widget.maxLen,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          onChanged: widget.onChanged,
          focusNode: focusNode,
            controller: widget.controller,
            obscureText: widget.obscureText ?? false,
            decoration: InputDecoration(
              counterText: '',
                icon: SvgPicture.asset(
                  widget.icon!,
                  height: 30,
                  width: 30,
                ),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: GoogleFonts.yaldevi(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black))),
      ),
    );
  }
  Color _getBackgroundColor() {
    return hasFocus ? Colors.white : Colors.white;
  }

  List<BoxShadow> _getBoxShadow() {

    return hasFocus
        ? [
            BoxShadow(
              color: const Color(0xff44CBE8).withOpacity(0.7),
              blurRadius: 5,
              spreadRadius: 3,
              offset: const Offset(0, 7),
            ),
          ]
        : [];
  }

  void onFocusChange() {
    setState(() {
      hasFocus = focusNode.hasFocus;
    });
  }
}

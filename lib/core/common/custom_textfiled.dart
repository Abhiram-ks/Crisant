
import 'package:crisent_pannel/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextedit extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final TextEditingController controller;
  final String? Function(String? value)? validate;
  final Color? filledColor;
  final void Function(String)? onChanged; 

  const CustomTextedit({
    super.key,
    required this.label,
    this.prefixIconColor,
    this.hintText,
    this.prefixIcon,
    required this.controller,
    this.validate,
    this.filledColor,
    this.onChanged, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                  child: Text(
                    label ?? 'Unknown Field',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              TextFormField(
                controller: controller,
                validator: validate,
                style: const TextStyle(fontSize: 16),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: onChanged, 
                decoration: InputDecoration(
                  filled: true,
                  fillColor: filledColor ?? AppPalette.whiteColor,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(152, 152, 152, 1),
                  ),
                  prefixIcon: prefixIcon != null
                      ? Icon(
                          prefixIcon,
                          color: prefixIconColor ??const Color.fromARGB(255, 152, 152, 152),
                        )
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 207, 207, 207), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: AppPalette.buttonColor, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppPalette.redColor, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppPalette.redColor, width: 1),
                  ),
                ),
              ),
            ],
          );
  }
}

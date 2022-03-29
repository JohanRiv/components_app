import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? validationText;
  final TextInputType? inputType;
  final bool? isPasswordField;
  final TextCapitalization? textCapitalization;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    Key? key,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.helperText,
    this.validationText,
    this.inputType,
    this.isPasswordField = false,
    this.textCapitalization,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordField!,
      keyboardType: inputType,
      autofocus:
          false, // Permite que el campo tenga foco automatico al ingresar al screen
      textCapitalization:
          textCapitalization!, // Permite generar una condición de escritura
      onChanged: (value) => formValues[formProperty] =
          value, // Con esta opción se logra capturar el texto
      validator: (value) => value == null || value.trim() == ''
          ? validationText
          : null, // Función de validación del input
      autovalidateMode:
          AutovalidateMode.onUserInteraction, // Activa la validación del campo
      decoration: InputDecoration(
        hintText: hintText, // Placeholder del imput
        labelText: labelText, // Titulo del campo
        helperText: helperText, // Mensaje de guía
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon), // icono al inicio del input que mueve solo el campo de texto
        suffixIcon: suffixIcon == null
            ? null
            : Icon(
                suffixIcon), // icono al final del input que mueve solo el campo de texto
        icon: icon == null
            ? null
            : Icon(icon), // icono al inicio del input que mueve todo el input
      ),
    );
  }
}

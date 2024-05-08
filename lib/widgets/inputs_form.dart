import 'package:flutter/material.dart';

class InputsForm extends StatelessWidget {
  final bool readOnly;
  final bool autofocus;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enable;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? suffixIcon;

  final String inputName;
  final Map<String, dynamic> inputValues;

  const InputsForm({
    Key? key,
    this.maxLength,
    this.keyboardType,
    this.hintText,
    this.helperText,
    this.suffixIcon,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.enable = true,
    this.labelText,
    required this.inputName,
    required this.inputValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      readOnly: readOnly,
      maxLength: maxLength,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enable,
      onChanged: (value) => inputValues[inputName] = value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        //icon: Icon(Icons.email),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        //prefixIcon: Icon(Icons.mark_email_read_rounded),
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
      ),
      validator: (value) {
        if (value == null || value == '') return 'Campo requerido';

        //return EvaluateInput(value,inputName,type)
        if (inputName == 'dni' && int.tryParse(value) == null)
          return 'solo numeros';
        if (inputName == 'email' && !isEmail(value)) return 'email inválido';
        return value.length < 6 ? 'Mínimo de 6 caracteres' : null;
      },
    );
  }

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }
}

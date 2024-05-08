import 'package:flutter/material.dart';

import '../widgets/inputs_form.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final Map<String, dynamic> valuesForm = {
    'firstname': '',
    'lastname': '',
    'email': '',
    'dni': '',
    'password': '',
  };

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registrarse'),
        elevation: 10,
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                InputsForm(
                  labelText: 'Nombre',
                  inputName: 'firstname',
                  inputValues: valuesForm,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputsForm(
                  labelText: 'Apellido',
                  inputName: 'lastname',
                  inputValues: valuesForm,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputsForm(
                  labelText: 'DNI',
                  maxLength: 8,
                  helperText: 'EJ.22123456',
                  keyboardType: TextInputType.number,
                  inputName: 'dni',
                  inputValues: valuesForm,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputsForm(
                  helperText: 'Ej: name@dominio.com',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Icons.email,
                  inputName: 'email',
                  inputValues: valuesForm,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputsForm(
                  helperText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: Icons.password,
                  inputName: 'password',
                  inputValues: valuesForm,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900]),
                  child: const SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(child: const Text('Guardar'))),
                  onPressed: () {
                    print(valuesForm);
                    FocusManager.instance.primaryFocus?.unfocus();

                    if (!keyForm.currentState!.validate()) {
                      print('Formulario no válido');
                      return;
                    }
                    print(valuesForm);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:components_app/widgets/widgets.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();

    final Map<String, dynamic> formValues = {
      'firstName': '',
      'lastName': '',
      'email': '',
      'password': '',
      'role': ''
    };

    void displayDialogAndroid(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Alert'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Verifica los datos ingresados'),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Ok')),
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Cancel'))
                ],
              ));
    }

    void displayDialogIos(BuildContext context) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: const Text('Alert'),
                content: Column(children: const [
                  Text('Verifica los datos ingresados'),
                ]),
                actions: [
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Ok')),
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Cancel'),
                      style: TextButton.styleFrom(
                        backgroundColor: null,
                        textStyle:
                            TextStyle(foreground: Paint()..color = Colors.red),
                      ))
                ],
              ));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Form'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Form(
              key: formRegisterKey,
              child: Column(
                children: [
                  Column(children: [
                    const SizedBox(height: 20),
                    CustomInputField(
                      icon: Icons.perm_contact_cal_sharp,
                      labelText: 'Nombres',
                      hintText: 'Ej: Juan',
                      validationText: 'Este campo es requerido!',
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      formProperty: 'firstName',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      icon: Icons.perm_contact_cal_sharp,
                      labelText: 'Apellidos',
                      hintText: 'Ej: Perez',
                      validationText: 'Este campo es requerido!',
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      formProperty: 'lastName',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      icon: Icons.mail_outline_rounded,
                      labelText: 'Email',
                      hintText: 'Ej: tuemail@mail.com',
                      validationText: 'Este campo es requerido!',
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      formProperty: 'email',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      icon: Icons.password,
                      labelText: 'Contraseña',
                      hintText: 'Ej: 12pH-3jf',
                      validationText: 'Este campo es requerido!',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      isPasswordField: true,
                      formProperty: 'password',
                      formValues: formValues,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<String>(
                        icon: const Icon(Icons.arrow_downward_sharp),
                        value: 'User',
                        items: const [
                          DropdownMenuItem(
                            child: Text('Admin'),
                            value: 'Admin',
                          ),
                          DropdownMenuItem(
                            child: Text('User'),
                            value: 'User',
                          ),
                        ],
                        onChanged: (value) {
                          print(value);
                          formValues['role'] = value;
                        }),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          // Permite validar las validaciones de los campos del formulario
                          if (!formRegisterKey.currentState!.validate()) {
                            print('No valido!');
                            Platform.isAndroid
                                ? displayDialogAndroid(context)
                                : displayDialogIos(context);
                          } else {
                            print('Valido');
                            print(formValues);
                          }
                        },
                        child: const SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Center(
                              child: Text('Guardar'),
                            )))
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}

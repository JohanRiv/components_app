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
                      hintText: 'Juan',
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
                      hintText: 'Perez',
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
                      hintText: 'tuemail@mail.com',
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
                      hintText: '*******',
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

import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(children: [
              TextFormField(
                autofocus:
                    true, // Permite que el campo tenga foco automatico al ingresar al screen
                textCapitalization: TextCapitalization
                    .words, // Permite generar una condición de escritura
                onChanged: (value) =>
                    {}, // Con esta opción se logra capturar el texto
                validator: (value) => value == null || value.trim() == ''
                    ? 'Este campo es requerido'
                    : null,
                autovalidateMode: AutovalidateMode
                    .onUserInteraction, // Activa la validación del campo
                decoration: const InputDecoration(
                    hintText: 'Franciso0', // Placeholder del imput
                    labelText: 'Nombre de Usuario', // Titulo del campo
                    helperText:
                        'Este campo permite letras y números', // Mensaje de guía
                    prefixIcon: Icon(Icons
                        .people), // icono al inicio del input que mueve solo el campo de texto
                    suffixIcon: Icon(Icons
                        .people), // icono al final del input que mueve solo el campo de texto
                    icon: Icon(Icons
                        .people), // icono al inicio del input que mueve todo el input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ) // Adicionar borde al input
                    ),
              )
            ]),
          ),
        ));
  }
}

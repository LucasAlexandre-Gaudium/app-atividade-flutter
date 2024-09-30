import 'package:atividade_um/domain/bloc/formulario_bloc.dart';
import 'package:atividade_um/domain/bloc/formulario_event.dart';
import 'package:atividade_um/domain/bloc/formulario_state.dart';
import 'package:atividade_um/presentation/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormularioWidget extends StatelessWidget {
  // Como estamos utilizando o bloc, não foi necessário utilizar um StatefulWidget
  const FormularioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FormularioBloc(),
        child: BlocListener<FormularioBloc, FormularioState>(
          listener: (context, state) {
            if (state.submitted && state.isValid) { 
            // Como a tela será atualizada sempre que um input de texto for feito, a flag formSubmitted faz com que apareca apenas ao clicar no Enviar
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Sucesso'),
                    content: const Text(
                        'Todos os campos foram preenchidos corretamente!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Fecha o alerta
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Form(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Text(
                      'Insira seus dados para entrar',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: BlocBuilder<FormularioBloc, FormularioState>(
                          builder: (context, state) {
                            return CustomTextField(
                              placeholder: 'Nome',
                              onChanged: (value) => context
                                  .read<FormularioBloc>()
                                  .add(NomeChanged(value)),
                              errorText: state.nomeError,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: BlocBuilder<FormularioBloc, FormularioState>(
                          builder: (context, state) {
                            return CustomTextField(
                              placeholder: 'Sobrenome',
                              onChanged: (value) => context
                                  .read<FormularioBloc>()
                                  .add(SobrenomeChanged(value)),
                              errorText: state.sobrenomeError,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<FormularioBloc, FormularioState>(
                    builder: (context, state) {
                      return CustomTextField(
                        placeholder: 'Email',
                        onChanged: (value) => context
                            .read<FormularioBloc>()
                            .add(EmailChanged(value)),
                        errorText: state.emailError,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: BlocBuilder<FormularioBloc, FormularioState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Se não tiver dentro de um blocBuilder, ele não envia o evento, por isso não estava validando os campos todos juntos
                                  context
                                      .read<FormularioBloc>()
                                      .add(FormSubmitted());
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size.fromHeight(42),
                                  backgroundColor: Colors.amber,
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text('Entrar'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

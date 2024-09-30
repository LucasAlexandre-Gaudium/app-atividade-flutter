import 'package:atividade_um/domain/bloc/formulario_event.dart';
import 'package:atividade_um/domain/bloc/formulario_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  FormularioBloc() : super(FormularioState()) {
    on<NomeChanged>((event, emit) {
      final nomeError = event.nome.isEmpty ? 'Campo não pode ser vazio' : '';
      emit(state.copyWith(nome: event.nome, nomeError: nomeError, submitted: false));
    });

    on<SobrenomeChanged>((event, emit) {
      final error = event.sobrenome.isEmpty ? 'Campo não pode ser vazio' : '';
      emit(state.copyWith(sobrenome: event.sobrenome, sobrenomeError: error, submitted: false));
    });

    on<EmailChanged>((event, emit) {
      final error = event.email.isEmpty ? 'Campo não pode ser vazio' : '';
      emit(state.copyWith(email: event.email, emailError: error, submitted: false));
    });

    on<FormSubmitted>((event, emit) {
      final nomeError = state.nome.isEmpty ? 'Campo não pode ser vazio' : null;
      final sobrenomeError = state.sobrenome.isEmpty ? 'Campo não pode ser vazio' : null;
      final emailError = state.email.isEmpty ? 'Campo não pode ser vazio' : null;
      final isValid = nomeError == null && sobrenomeError == null && emailError == null;

      emit(state.copyWith(
        nomeError: nomeError,
        sobrenomeError: sobrenomeError,
        emailError: emailError,
        isValid: isValid,
        submitted: true,
      ));
    });
  }
}

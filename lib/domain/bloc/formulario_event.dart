abstract class FormularioEvent {}

class NomeChanged extends FormularioEvent {
  final String nome;
  NomeChanged(this.nome);
}

class SobrenomeChanged extends FormularioEvent {
  final String sobrenome;
  SobrenomeChanged(this.sobrenome);
}

class EmailChanged extends FormularioEvent {
  final String email;
  EmailChanged(this.email);
}

class FormSubmitted extends FormularioEvent {}

class FormularioState {
  final String nome;
  final String sobrenome;
  final String email;
  final bool isValid;
  final String? nomeError;
  final String? sobrenomeError;
  final String? emailError;
  final bool submitted; // Flag para indicar se o formulário foi submetido

  FormularioState({
    this.nome = '',
    this.sobrenome = '',
    this.email = '',
    this.isValid = false,
    this.nomeError,
    this.sobrenomeError,
    this.emailError,
    this.submitted = false, // Inicialmente não submetido
  });

  FormularioState copyWith({
    String? nome,
    String? sobrenome,
    String? email,
    bool? isValid,
    String? nomeError,
    String? sobrenomeError,
    String? emailError,
    bool? submitted,
  }) {
    return FormularioState(
      nome: nome ?? this.nome,
      sobrenome: sobrenome ?? this.sobrenome,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      nomeError: nomeError ?? this.nomeError,
      sobrenomeError: sobrenomeError ?? this.sobrenomeError,
      emailError: emailError ?? this.emailError,
      submitted: submitted ?? this.submitted,
    );
  }
}

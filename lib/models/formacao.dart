class Formacao {
  final String nome;

  final int goleiro;
  final int defensores;
  final int meioCampo;
  final int atacantes;

  const Formacao({
    required this.nome,
    this.goleiro = 1,
    required this.defensores,
    required this.meioCampo,
    required this.atacantes,
  });

  int get total => goleiro + defensores + meioCampo + atacantes;
}
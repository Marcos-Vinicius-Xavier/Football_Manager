import 'jogador.dart';

class Time {
  String nome;
  String tecnico;
  int vitorias;
  int derrotas;
  int empates;
  int golsMarcados;
  int golsSofridos;
  List<Jogador> jogadores;
  List<String> titulos;


  Time({
    required this.nome,
    required this.tecnico,
    required this.vitorias,
    required this.derrotas,
    required this.empates,
    required this.golsMarcados,
    required this.golsSofridos,
    required this.jogadores,
    required this.titulos
  });
}

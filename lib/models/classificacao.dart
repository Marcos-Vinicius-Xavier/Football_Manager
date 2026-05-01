import 'time.dart';

class Classificacao {
  Time time;
  int partidas;
  int pontos;
  int vitorias;
  int derrotas;
  int empates;
  int golsMarcados;
  int golsSofridos;
  int saldoGols;

  Classificacao({
    required this.time,
    required this.partidas,
    required this.pontos,
    required this.vitorias,
    required this.derrotas,
    required this.empates,
    required this.golsMarcados,
    required this.golsSofridos,
    required this.saldoGols,
  });

  int get saldo {
    return golsMarcados - golsSofridos;
  }
}

import 'dart:math';
import '../models/time.dart';

class Resultado {
  int golsCasa;
  int golsFora;

  Resultado(this.golsCasa, this.golsFora);
}

class SimuladorService {
  final random = Random();

  int gerarGols(double ataque, double defesa) {
    double xg = (ataque / defesa) * 1.2;
    xg = xg.clamp(0.2, 3.5);

    int gols = 0;
    for (int i = 0; i < 5; i++) {
      if (random.nextDouble() < xg / 5) {
        gols++;
      }
    }
    return gols;
  }

  Resultado simularJogo(Time casa, Time fora) {
    double ataqueCasa = casa.ataque * 1.15;
    double defesaCasa = casa.defesa * 1.1;

    int golsCasa = gerarGols(ataqueCasa, fora.defesa);
    int golsFora = gerarGols(fora.ataque, defesaCasa);

    return Resultado(golsCasa, golsFora);
  }
}
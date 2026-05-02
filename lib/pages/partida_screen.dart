import 'package:flutter/material.dart';
import '../controllers/partida_controller.dart';

class PartidaScreen extends StatefulWidget {
  final PartidaController controller;

  const PartidaScreen({super.key, required this.controller});

  @override
  State<PartidaScreen> createState() => _PartidaScreenState();
}

class _PartidaScreenState extends State<PartidaScreen> {
  @override
  void initState() {
    super.initState();

    widget.controller.onUpdate = () => setState(() {});
    widget.controller.onFinish = () {
      Navigator.pop(context);
    };

    widget.controller.iniciar();
  }

  @override
  Widget build(BuildContext context) {
    final jogo = widget.controller.jogo;

    return Scaffold(
      appBar: AppBar(title: Text('Partida')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${jogo.minuto}\'', style: TextStyle(fontSize: 32)),
            SizedBox(height: 20),
            Text(
              '${jogo.casa.nome} ${jogo.golsCasa} x ${jogo.golsFora} ${jogo.fora.nome}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
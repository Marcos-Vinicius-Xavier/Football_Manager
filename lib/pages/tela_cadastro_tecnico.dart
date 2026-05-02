import 'package:flutter/material.dart';
import 'package:football_manager/models/tecnico.dart';
import 'package:football_manager/data/tecnico_data.dart';

class TelaCadastroTecnico extends StatefulWidget {

  const TelaCadastroTecnico({super.key});

  @override
  State<TelaCadastroTecnico> createState() => _TelaCadastroTecnicoState();
}
class _TelaCadastroTecnicoState extends State<TelaCadastroTecnico> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();

  String? _estiloJogo;

  final List<String> _estilosJogo = [
    'Ofensivo',
    'Defensivo',
    'Moderado',
  ];

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
     tecnico = Tecnico(
      nome: _nomeController.text,
      idade: int.tryParse(_idadeController.text) ?? 0,
      estiloDeJogo: _estiloJogo ?? 'Moderado',
    );

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Técnico criado!\nNome: ${tecnico!.nome}\nIdade: ${tecnico!.idade}\nEstilo: ${tecnico!.estiloDeJogo}',
        ),
      ),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Técnico'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Idade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a idade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _estiloJogo,
                items: _estilosJogo.map((estilo) {
                  return DropdownMenuItem(value: estilo, child: Text(estilo));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _estiloJogo = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Estilo de Jogo'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _salvar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

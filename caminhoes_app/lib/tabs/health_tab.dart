import 'package:caminhoes_app/widgets/suggestions.dart';
import 'package:flutter/material.dart';

class HealthTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, nome",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Column( children: [
                SuggestionsCard(name: 'Alimentação', description: 'Beba água suficiente para seu corpo.',),
                SuggestionsCard(name: 'Exercício Físico', description: 'Quando sair do carro e se alongue.',),
                SuggestionsCard(name: 'Saúde Mental', description: 'Noites mal dormidas colaboram para agravar os transtornos emocionais e físicos.',),
              ])
              
            ],
          ))
    ]);
  }
}

import 'package:caminhoes_app/tiles/health_tile.dart';
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
              HealthCategory(name: 'Alimentação', icon: Icons.local_dining)
            ],
          ))
    ]);
  }
}

class HealthCategory extends StatelessWidget {
  final name;
  final icon;

  const HealthCategory({
    Key key,
    this.name,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(name,
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700)),
        leading: Icon(
          icon,
          color: Theme.of(context).accentColor,
        ),
        children: [
          HealthTile(
              titulo: 'Dicas básicas de alimentação', content: 'Conteudo')
        ],
      ),
    );
  }
}


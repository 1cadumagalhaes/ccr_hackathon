// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Alimentação',
    child: Column (
      children: [
        Text('Cuide da alimentação.
        Comer bem não tem a ver apenas com a boa forma física, mas com o bem-estar geral. 
        Opte por um cardápio variado e equilibrado. 
        E nem precisa ser nada mirabolante, e sim usando o que você  tem no dia a dia mesmo.',
        style: TextStyle(decoration: TextDecoration.none, color: Colors.grey),
        ),
        Text('')
      ],)
    ],
  ),
  Entry(
    'Exercício Físico',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Saúde Mental',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
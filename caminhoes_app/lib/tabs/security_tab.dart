import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("segurança").getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }else{
          List<Widget> lista =  snapshot.data.documents.map((doc)=>ContactCard(doc)).toList();
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Telefones", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height:30),
                Expanded(child: ListView(children: lista,),)
              ],
            ),
          );
        }
      },
    );
  }
}


class ContactCard extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ContactCard(this.snapshot);
  @override
  Widget build(BuildContext context) {
    var name = snapshot['name'], phone = snapshot['phone'];
    return Card(
      color: Colors.blueGrey[100],
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                Text(phone)
              ],)
            ],),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    Share.share('Ligue para $name: $phone');
                  },
                  child: Row(children: [
                    Icon(Icons.share),
                    SizedBox(width: 8),
                    Text('Compartilhar')
                  ],),
                  
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    launch("tel:$phone");
                  },
                  child: Row(children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8),
                    Text('Ligar')
                  ],),
                  
                ),
              ],
            )
          ],
        )
      ),
    )
        ;
  }
}
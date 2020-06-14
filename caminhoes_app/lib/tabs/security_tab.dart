import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Telefones", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          SizedBox(height:30),
          ContactCard(name: "Nome do lugar",phone:"(XX) XXXX-XXXX")
        ],
      ),
    );
  }
}


class ContactCard extends StatelessWidget {
  final phone;
  final name;

  const ContactCard({Key key, this.phone, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
      )
        ;
  }
}
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTile(this.icon, this.text, this.pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 45,
          padding: EdgeInsets.only(left: 32),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32,
                color: pageController.page.round()==page? Colors.white : Colors.grey[700],
              ),
              SizedBox(width: 32,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: pageController.page.round()==page? Colors.white : Colors.grey[700]
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
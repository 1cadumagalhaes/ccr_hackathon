import 'package:flutter/material.dart';

class RenderStars extends StatelessWidget {
  final double nota;
  final double size;

  RenderStars(this.nota, this.size);

//Icon(Icons.star, size: size);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var temp = nota;
      var stars = <Widget>[];
      
      for (var i = 5; i >= 1; i--) {
        if (temp == i) {
          stars.add(Icon(Icons.star, size: size));
          temp--;
        } else if (temp<=i &&temp> (i - 1)) {
          stars.add(Icon(Icons.star_half, size: size));
          temp -= temp%1;
        } else {
          stars.add(Icon(Icons.star_border, size: size));
        }
      }
      stars.add(Text(nota.toString(), style: TextStyle(fontSize: size),));
      var reversedStars = new List<Widget>.from(stars.reversed);
      return Row(children: reversedStars,);
    });
  }
}

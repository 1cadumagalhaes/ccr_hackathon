import 'package:flutter/material.dart';

class RenderStars extends StatelessWidget {
  final double nota;

  RenderStars(this.nota);

//Icon(Icons.star, size: 14);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var temp = nota;
      var stars = <Widget>[];
      
      for (var i = 5; i >= 1; i--) {
        print(temp);
        if (temp == i) {
          stars.add(Icon(Icons.star, size: 14));
          temp--;
        } else if (temp<=i &&temp>= (i - 1)) {
          stars.add(Icon(Icons.star_half, size: 14));
          temp -= temp%1;
        } else {
          stars.add(Icon(Icons.star_border, size: 14));
        }
      }
      stars.add(Text(nota.toString()));
      var reversedStars = new List<Widget>.from(stars.reversed);
      return Row(children: reversedStars,);
    });
  }
}

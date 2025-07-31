import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MoviedetailsElementsWid extends StatelessWidget {
  String text1;
  String text2;
  int maxlines;
   MoviedetailsElementsWid({super.key,required this.text1,required this.text2, required this.maxlines});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text("$text1  ",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),
        Expanded(
          child: Text(
            maxLines: maxlines,
            overflow: TextOverflow.ellipsis,
            text2,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300
            ),
          ),
        ),                                                
      ],
    );
  }
}
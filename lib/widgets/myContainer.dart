import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String Question ;
  final Function onPressed;
  String image;
  MyContainer(this.Question,this.image,this.onPressed);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        height: 220,
        width: 160,
        decoration: BoxDecoration(
          color: Color(0xff0c2551),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: 165,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(image),
                  fit: BoxFit.fill
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(7.0, 1, 2, 0),
              child: Center(
                child: Text(Question,style: TextStyle(
                  color: Colors.grey[200],
                  fontFamily: 'Cardo',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}

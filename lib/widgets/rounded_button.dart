import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  //const RoundedButton({Key? key}) : super(key: key);


  final String name;
  final double height;
  final double width;
  final Function onPressed;

  const RoundedButton(

    {required this.name,
      required this.height,
      required this.width,
      required this.onPressed,
    
    }
  );


  @override
  Widget build(BuildContext context) {
    return Container(

        height: height,
        width: width,
        child: TextButton(
          
          onPressed: () => onPressed(),
          child: Text(name,style: TextStyle(color: Colors.white,fontSize: 22, height: 1.5),)
        
        
        
        ),

        decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(height*0.25),color: Colors.blue ),



    );
  }
}
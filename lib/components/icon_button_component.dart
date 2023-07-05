import 'package:flutter/material.dart';

class IconButtonSelector  extends StatelessWidget {
  final double size;
  final IconData icon;
  final Color? cor;
  final Function()? onPressed;


  const IconButtonSelector ({
    super.key, 
    this.onPressed,
    this.icon = Icons.add,
    this.size = 24,
    this.cor
    });

  @override
  Widget build(BuildContext context) {
    return IconButton(
       icon: Icon(icon),
       color: cor,
       iconSize: size,
       onPressed: onPressed     
       );
       
  }
}
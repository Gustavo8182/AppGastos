import 'package:flutter/material.dart';

class SpaceComponent extends StatelessWidget{
  final double? size;
  final bool isFull;
  final bool isHorizontal;

// poderia requerer os valores no construtor de fora obrigatorio com o requered antes do this.
  const SpaceComponent({
    super.key,
    this.size = 16,
    this.isFull = false,
    this.isHorizontal = false

  });

  @override
  Widget build(BuildContext context) {
    
    if(isFull == true){
      return const Spacer();
    }
    return SizedBox(
      height: size,
      width: isHorizontal? size:null,
    ); 
  }

}
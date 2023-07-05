import 'package:controle_gastos/entities/Iten_sentity.dart';

class ListaItensChecklistEnty {
  String titulo;
  List<Itensentity>? listItens;

  ListaItensChecklistEnty({
    required this.titulo,
        
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
    };
  }

  factory ListaItensChecklistEnty.fromJson(Map<String, dynamic> json) {
    return ListaItensChecklistEnty(
      titulo: json['titulo'],
      );
  }

  static List<ListaItensChecklistEnty> fromJsonList(List<dynamic>? json) {
    return json?.map((e) => ListaItensChecklistEnty.fromJson(e)).toList() ?? [];
  }
}

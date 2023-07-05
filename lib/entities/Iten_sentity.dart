
class Itensentity {
  String uuid;
  String titulo;
  double? valor;
  DateTime dataRegistro;  
  

  Itensentity({
    required this.uuid,
    required this.titulo,
    required this.valor,
    required this.dataRegistro,
    });

  factory Itensentity.fromJson(Map<String, dynamic> json) {
    return Itensentity(
      uuid: json['uuid'],
      titulo: json['titulo'],
      valor: json['valor'],
      dataRegistro: DateTime.fromMicrosecondsSinceEpoch(json['dataRegistro']),
     );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'titulo': titulo,
      'valor': titulo,
      'dataInicio': dataRegistro.microsecondsSinceEpoch,
     };
  }

  static List<Itensentity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => Itensentity.fromJson(item)).toList() ?? [];
  }
}

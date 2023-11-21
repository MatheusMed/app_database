// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TarefaModel {
  int? id;
  final String titulo;
  final String descricao;
  final String status;
  TarefaModel({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'status': status,
    };
  }

  factory TarefaModel.fromMap(Map<String, dynamic> map) {
    return TarefaModel(
      id: map['id'] as int,
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TarefaModel.fromJson(String source) =>
      TarefaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TarefaModel(id: $id, titulo: $titulo, descricao: $descricao, status: $status)';
  }

  @override
  bool operator ==(covariant TarefaModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.descricao == descricao &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^ titulo.hashCode ^ descricao.hashCode ^ status.hashCode;
  }
}

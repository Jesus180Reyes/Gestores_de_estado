class Usuario {
  String nombre;
  int? edad;
  List<String>? profesiones;

  Usuario({
    this.edad,
    required this.nombre,
    this.profesiones,
  });
}

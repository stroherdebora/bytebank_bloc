class Transferencia {
  final String conta;
  final String valor;

  Transferencia(
    this.valor,
    this.conta,
  );

  @override
  String toString() => 'TransferĂȘncia (conta: $conta, valor: $valor)';
}

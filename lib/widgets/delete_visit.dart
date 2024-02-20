String deleteVisit(String logText) {
  String now = DateTime.now().toString();

  logText = '$logText\n $now - Probando borrado de visitas';
  return logText;
}

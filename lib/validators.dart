class Validators {
  String? Function(String?) billAmount = (string) {
    if (string!.isEmpty) {
      return 'Enter Bill Amount';
    }
    return null;
  };
}

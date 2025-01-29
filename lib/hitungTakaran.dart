abstract class takaran {
  double hitungNasi();
  double hitungAir();
}

class berdasarkanPorsi extends takaran {
  double porsi;
  berdasarkanPorsi(this.porsi);

  @override
  double hitungNasi() {
    return porsi * 0.5;
  }

  @override
  double hitungAir() {
    return porsi * 0.5;
  }
}

class berdasarkanBeras extends takaran {
  double beras;
  berdasarkanBeras(this.beras);

  @override
  double hitungNasi() {
    return beras;
  }

  @override
  double hitungAir() {
    return beras * 2;
  }
}
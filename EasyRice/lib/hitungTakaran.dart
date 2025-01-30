abstract class takaran {
  final double berasPerPorsi = 100;

  double rasioBerasAir();
   
   Map<String, double> hitungTakaran({double? gramBeras, int? sajianNasi}) {

    double mlAir = 0;
    double outputBeras = 0;
    double rasio = rasioBerasAir();

    if (sajianNasi != null) {
      outputBeras = sajianNasi * berasPerPorsi;
      mlAir = outputBeras * rasio;
    } else if (gramBeras != null) {
      mlAir = gramBeras * rasio;
    }

    return {
      "beras": outputBeras,
      "air": mlAir,
    };
   }
}

class berasPutih extends takaran{
  @override
  double rasioBerasAir() => 1.5;
}

class berasMerah extends takaran{
  @override
  double rasioBerasAir() => 2.0;
}

class berasHitam extends takaran{
  @override
  double rasioBerasAir() => 2.5;
}

class berasBasmati extends takaran{
  @override
  double rasioBerasAir() => 1.75;
}

class berasCoklat extends takaran{
  @override
  double rasioBerasAir() => 2.25;
}

class berasKetan extends takaran{
  @override
  double rasioBerasAir() => 1.25;
}
import 'dart:math';

class AppPeople {
  static const String kirill = 'assets/images/people/kirill.jpg';
  static const String ksusha = 'assets/images/people/ksusha.jpg';
  static const String natasha = 'assets/images/people/natasha.jpg';
  static const String sasha = 'assets/images/people/sasha.jpg';
  static const String serezha = 'assets/images/people/serezha.jpg';
  static const String sveta = 'assets/images/people/sveta.jpg';
  static const String vanya = 'assets/images/people/vanya.jpg';
  static const String vasya = 'assets/images/people/vasya.jpg';
  static const String vera = 'assets/images/people/vera.png';
  static const String vika = 'assets/images/people/vika.jpg';
  static const String danila = 'assets/images/people/danila.jpg';
  static const String arishka = 'assets/images/people/arishka.jpg';
  static const String arbuzova = 'assets/images/people/arbuzova.png';
  static const String rodorlovy1 = 'assets/images/people/rodorlovy1.png';
  static const String rodorlovy2 = 'assets/images/people/rodorlovy2.png';
  static const String tanyaOrlova = 'assets/images/people/tanyaorlov.png';
  static const String sashaOrlova = 'assets/images/people/sashaorlov.png';
  static const String svetaBab = 'assets/images/people/svetabab.png';
  static const String niny = 'assets/images/people/niny.png';
  static const String valyao = 'assets/images/people/valyao.png';
  static const String valyap = 'assets/images/people/valyap.png';
  static const String vova = 'assets/images/people/vova.png';
  static const String tanya = 'assets/images/people/tanya.png';

  List<String> people = [
    niny,
    svetaBab,
    tanya,
    valyap,
    valyao,
    vova,
    arishka,
    arbuzova,
    rodorlovy1,
    rodorlovy2,
    tanyaOrlova,
    kirill,
    sashaOrlova,
    ksusha,
    natasha,
    sasha,
    serezha,
    sveta,
    vanya,
    vasya,
    vera,
    vika,
    danila
  ];

  List<String> getList() {
    return people;
  }

  List<String> getPeople() {
    List<String> vspomPeople = [];
    var copy = people.toList();
    final _random = Random();
    for(int i = 0; i < people.length; i++) {
      String man = copy[_random.nextInt(people.length - i)];
      vspomPeople.add(man);
      copy.remove(man);
    }
    return vspomPeople;
  }
}
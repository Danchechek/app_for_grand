import 'package:app_for_grand/app/AppPeople.dart';

class AppVideos {
  static const String splashVideo = 'assets/videos/air.mp4';
  static const String vera = 'assets/videos/vera.MP4';
  static const String orlovy = 'assets/videos/orlovy.mp4';
  static const String dan = 'assets/videos/dan.MOV';
  static const String tanya = 'assets/videos/tanya.mov';
  static const String valyaO = 'assets/videos/valyao.mp4';
  static const String valyaP = 'assets/videos/valyap.mp4';
  static const String vano = 'assets/videos/vano.mp4';
  static const String vova = 'assets/videos/vova.mp4';
  static const String arbuzova = 'assets/videos/arbuzovy.MP4';
  static const String edic = 'assets/videos/edic.mp4';
  static const String rodorlov = 'assets/videos/rodorlov.mp4';
  static const String svetabab = 'assets/videos/svetabab.mp4';
  static const String shevch = 'assets/videos/shevch.MOV';
  static const String svetovo = 'assets/videos/svetovo.MOV';
  static const String itog = 'assets/videos/itog.mp4';

  static Map<String, String> VideoOfMan = {
    'itog': AppVideos.itog,
    AppPeople.danila: AppVideos.dan,
    AppPeople.valyao: AppVideos.valyaO ,
    AppPeople.vera: AppVideos.vera,
    AppPeople.kirill: AppVideos.svetovo,
    AppPeople.serezha: AppVideos.svetovo,
    AppPeople.vasya: AppVideos.svetovo,
    AppPeople.sveta: AppVideos.svetovo,
    AppPeople.svetaBab: AppVideos.svetabab,
    AppPeople.rodorlovy1: AppVideos.rodorlov,
    AppPeople.rodorlovy2: AppVideos.rodorlov,
    AppPeople.niny: AppVideos.edic,
    AppPeople.arbuzova: AppVideos.arbuzova,
    AppPeople.sashaOrlova: AppVideos.orlovy,
    AppPeople.tanyaOrlova: AppVideos.orlovy,
    AppPeople.vova: AppVideos.vova,
    AppPeople.vanya: AppVideos.vano,
    AppPeople.natasha: AppVideos.vano,
    AppPeople.arishka: AppVideos.vano,
    AppPeople.valyap: AppVideos.valyaP,
    AppPeople.tanya: AppVideos.tanya,
    AppPeople.vika: AppVideos.shevch,
    AppPeople.ksusha: AppVideos.shevch,
    AppPeople.sasha: AppVideos.shevch,

  };

  Map<String, String> GetVideoOfMan() {
    return VideoOfMan;
  }
}

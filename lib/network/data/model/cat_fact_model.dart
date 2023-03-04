import 'package:catfacts/network/data/vos/cat_fact_vo.dart';

abstract class CatFactModel {
  Future<CatFactVO> getRandomCatFact();
}

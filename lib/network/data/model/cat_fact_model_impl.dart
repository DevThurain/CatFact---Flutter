import 'dart:convert';

import 'package:catfacts/network/data/model/cat_fact_model.dart';
import 'package:catfacts/network/data/vos/cat_fact_vo.dart';
import 'package:dio/dio.dart';

class CatFactModelImpl extends CatFactModel {
  Dio dio = Dio();

  @override
  Future<CatFactVO> getRandomCatFact() async {
    var response = await dio.get("https://catfact.ninja/fact");

    CatFactVO catFactVO = CatFactVO.fromJson(response.data);

    return catFactVO;
  }
}

// To parse this JSON data, do
//
//     final cryptoModel = cryptoModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'crypto_model.freezed.dart';
part 'crypto_model.g.dart';

List<CryptoModel> cryptoModelFromJson(String str) => List<CryptoModel>.from(
    json.decode(str).map((x) => CryptoModel.fromJson(x)));

String cryptoModelToJson(List<CryptoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class CryptoModel with _$CryptoModel {
  const factory CryptoModel({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required double currentPrice,
    required int marketCap,
    required int marketCapRank,
    required int fullyDilutedValuation,
    required int totalVolume,
    required double high24H,
    required double low24H,
    required double priceChange24H,
    required double priceChangePercentage24H,
    required double marketCapChange24H,
    required double marketCapChangePercentage24H,
    required double circulatingSupply,
    required double totalSupply,
    required double maxSupply,
    @Default(42.0) double? ath,
    required double athChangePercentage,
    required DateTime athDate,
    required double atl,
    required double atlChangePercentage,
    required DateTime atlDate,
    required Roi roi,
    required DateTime lastUpdated,
  }) = _CryptoModel;

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);
}

@freezed
abstract class Roi with _$Roi {
  const factory Roi({
    required double times,
    required String currency,
    required double percentage,
  }) = _Roi;

  factory Roi.fromJson(Map<String, dynamic> json) => _$RoiFromJson(json);
}

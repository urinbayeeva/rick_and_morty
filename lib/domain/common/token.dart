import 'package:dartz/dartz.dart';

class Token extends Tuple3<String?, String?, String?> {
  String? get accessToken => value1;
  String? get refreshToken => value2;
  String? get tokenType => value3;

  Token({
    required String? accessToken,
    required String? refreshToken,
    required String? tokenType,
  }) : super(accessToken, refreshToken, tokenType);
}

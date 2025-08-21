import 'dart:convert';

import 'package:social_meda/constant.dart';
import 'package:social_meda/core/services/shared_prefence_singleton.dart';
import 'package:social_meda/features/auth/data/model/app_user_model.dart';
import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';

AppUserEntity getUserData() {
  var jsonString = SharedPreferenceSingleton.getString(kUserData);
  var userentity = AppUserModel.fromJson(jsonDecode(jsonString));
  return userentity;
}

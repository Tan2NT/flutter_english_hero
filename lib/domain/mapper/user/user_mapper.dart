import 'package:english_hero/data/common/model/user/user_entity.dart';

import '../mapper.dart';
import '../../model/user/user.dart';
import '../../../data/common/model/user/user_entity.dart';

class UserMapper implements Mapper<UserEntity, User> {
  @override
  User mapFromEntity(UserEntity userEntity) {
    return User(
        email: userEntity.email,
        userId: userEntity.userId,
        token: userEntity.token,
        expiryDate: userEntity.expiryDate);
  }

  @override
  UserEntity mapToEntity(User user) {
    return UserEntity(
        email: user.email,
        userId: user.userId,
        token: user.token,
        expiryDate: user.expiryDate);
  }
}

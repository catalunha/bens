import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:bens/app/data/datasources/back4app/entity/user_entity.dart';
import 'package:bens/app/domain/models/goods_model.dart';

class GoodsEntity {
  static const String className = 'Goods';
  GoodsModel fromParse(ParseObject parseObject) {
    print('GoodsEntity: ${parseObject.objectId}');
    GoodsModel model = GoodsModel(
      id: parseObject.objectId!,
      user: UserEntity().fromParse(parseObject.get('user') as ParseUser),
      name: parseObject.get('name'),
      description: parseObject.get('description'),
      image: parseObject.get('image')?.get('url'),
      barcode: parseObject.get('barcode')?.get('url'),
      ownership: parseObject.get('ownership'),
      room: parseObject.get('room'),
      volumeX: parseObject.get('volumeX'),
      volumeY: parseObject.get('volumeY'),
      volumeZ: parseObject.get('volumeZ'),
      weight: parseObject.get('weight'),
      latitude: parseObject.get<ParseGeoPoint>('latlong')?.latitude,
      longitude: parseObject.get<ParseGeoPoint>('latlong')?.longitude,
    );
    return model;
  }

  Future<ParseObject> toParse(GoodsModel model) async {
    final parseObject = ParseObject(GoodsEntity.className);
    if (model.id != null) {
      parseObject.objectId = model.id;
    }
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    parseObject.set('user', currentUser);
    parseObject.set('name', model.name);
    parseObject.set('description', model.description);
    parseObject.set('ownership', model.ownership);
    parseObject.set('room', model.room);
    if (model.volumeX != null) {
      parseObject.set('volumeX', model.volumeX);
    }
    if (model.volumeY != null) {
      parseObject.set('volumeY', model.volumeY);
    }
    if (model.volumeZ != null) {
      parseObject.set('volumeZ', model.volumeZ);
    }
    if (model.weight != null) {
      parseObject.set('weight', model.weight);
    }
    if (model.latitude != null && model.longitude != null) {
      parseObject.set(
          'latlong',
          ParseGeoPoint(
              latitude: model.latitude!.toDouble(),
              longitude: model.longitude!.toDouble()));
    }
    return parseObject;
  }
}

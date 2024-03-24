// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'entity.dart';

class ProfileEntityMapper extends ClassMapperBase<ProfileEntity> {
  ProfileEntityMapper._();

  static ProfileEntityMapper? _instance;
  static ProfileEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProfileEntity';

  static int _$no(ProfileEntity v) => v.no;
  static const Field<ProfileEntity, int> _f$no = Field('no', _$no);
  static String _$name(ProfileEntity v) => v.name;
  static const Field<ProfileEntity, String> _f$name = Field('name', _$name);
  static String _$email(ProfileEntity v) => v.email;
  static const Field<ProfileEntity, String> _f$email = Field('email', _$email);
  static String _$description(ProfileEntity v) => v.description;
  static const Field<ProfileEntity, String> _f$description =
      Field('description', _$description);
  static String _$pic(ProfileEntity v) => v.pic;
  static const Field<ProfileEntity, String> _f$pic = Field('pic', _$pic);
  static String _$updated(ProfileEntity v) => v.updated;
  static const Field<ProfileEntity, String> _f$updated =
      Field('updated', _$updated);

  @override
  final MappableFields<ProfileEntity> fields = const {
    #no: _f$no,
    #name: _f$name,
    #email: _f$email,
    #description: _f$description,
    #pic: _f$pic,
    #updated: _f$updated,
  };

  static ProfileEntity _instantiate(DecodingData data) {
    return ProfileEntity(data.dec(_f$no), data.dec(_f$name), data.dec(_f$email),
        data.dec(_f$description), data.dec(_f$pic), data.dec(_f$updated));
  }

  @override
  final Function instantiate = _instantiate;

  static ProfileEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProfileEntity>(map);
  }

  static ProfileEntity fromJson(String json) {
    return ensureInitialized().decodeJson<ProfileEntity>(json);
  }
}

mixin ProfileEntityMappable {
  String toJson() {
    return ProfileEntityMapper.ensureInitialized()
        .encodeJson<ProfileEntity>(this as ProfileEntity);
  }

  Map<String, dynamic> toMap() {
    return ProfileEntityMapper.ensureInitialized()
        .encodeMap<ProfileEntity>(this as ProfileEntity);
  }

  ProfileEntityCopyWith<ProfileEntity, ProfileEntity, ProfileEntity>
      get copyWith => _ProfileEntityCopyWithImpl(
          this as ProfileEntity, $identity, $identity);
  @override
  String toString() {
    return ProfileEntityMapper.ensureInitialized()
        .stringifyValue(this as ProfileEntity);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProfileEntityMapper.ensureInitialized()
                .isValueEqual(this as ProfileEntity, other));
  }

  @override
  int get hashCode {
    return ProfileEntityMapper.ensureInitialized()
        .hashValue(this as ProfileEntity);
  }
}

extension ProfileEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProfileEntity, $Out> {
  ProfileEntityCopyWith<$R, ProfileEntity, $Out> get $asProfileEntity =>
      $base.as((v, t, t2) => _ProfileEntityCopyWithImpl(v, t, t2));
}

abstract class ProfileEntityCopyWith<$R, $In extends ProfileEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? no,
      String? name,
      String? email,
      String? description,
      String? pic,
      String? updated});
  ProfileEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProfileEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProfileEntity, $Out>
    implements ProfileEntityCopyWith<$R, ProfileEntity, $Out> {
  _ProfileEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfileEntity> $mapper =
      ProfileEntityMapper.ensureInitialized();
  @override
  $R call(
          {int? no,
          String? name,
          String? email,
          String? description,
          String? pic,
          String? updated}) =>
      $apply(FieldCopyWithData({
        if (no != null) #no: no,
        if (name != null) #name: name,
        if (email != null) #email: email,
        if (description != null) #description: description,
        if (pic != null) #pic: pic,
        if (updated != null) #updated: updated
      }));
  @override
  ProfileEntity $make(CopyWithData data) => ProfileEntity(
      data.get(#no, or: $value.no),
      data.get(#name, or: $value.name),
      data.get(#email, or: $value.email),
      data.get(#description, or: $value.description),
      data.get(#pic, or: $value.pic),
      data.get(#updated, or: $value.updated));

  @override
  ProfileEntityCopyWith<$R2, ProfileEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProfileEntityCopyWithImpl($value, $cast, t);
}

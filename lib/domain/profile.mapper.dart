// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile.dart';

class ProfileMapper extends ClassMapperBase<Profile> {
  ProfileMapper._();

  static ProfileMapper? _instance;
  static ProfileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Profile';

  static int _$no(Profile v) => v.no;
  static const Field<Profile, int> _f$no = Field('no', _$no);
  static String _$name(Profile v) => v.name;
  static const Field<Profile, String> _f$name = Field('name', _$name);
  static String _$email(Profile v) => v.email;
  static const Field<Profile, String> _f$email = Field('email', _$email);
  static String _$desc(Profile v) => v.desc;
  static const Field<Profile, String> _f$desc = Field('desc', _$desc);
  static String _$pic(Profile v) => v.pic;
  static const Field<Profile, String> _f$pic = Field('pic', _$pic);
  static DateTime _$updated(Profile v) => v.updated;
  static const Field<Profile, DateTime> _f$updated =
      Field('updated', _$updated);

  @override
  final MappableFields<Profile> fields = const {
    #no: _f$no,
    #name: _f$name,
    #email: _f$email,
    #desc: _f$desc,
    #pic: _f$pic,
    #updated: _f$updated,
  };

  static Profile _instantiate(DecodingData data) {
    return Profile(data.dec(_f$no), data.dec(_f$name), data.dec(_f$email),
        data.dec(_f$desc), data.dec(_f$pic), data.dec(_f$updated));
  }

  @override
  final Function instantiate = _instantiate;

  static Profile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Profile>(map);
  }

  static Profile fromJson(String json) {
    return ensureInitialized().decodeJson<Profile>(json);
  }
}

mixin ProfileMappable {
  String toJson() {
    return ProfileMapper.ensureInitialized()
        .encodeJson<Profile>(this as Profile);
  }

  Map<String, dynamic> toMap() {
    return ProfileMapper.ensureInitialized()
        .encodeMap<Profile>(this as Profile);
  }

  ProfileCopyWith<Profile, Profile, Profile> get copyWith =>
      _ProfileCopyWithImpl(this as Profile, $identity, $identity);
  @override
  String toString() {
    return ProfileMapper.ensureInitialized().stringifyValue(this as Profile);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProfileMapper.ensureInitialized()
                .isValueEqual(this as Profile, other));
  }

  @override
  int get hashCode {
    return ProfileMapper.ensureInitialized().hashValue(this as Profile);
  }
}

extension ProfileValueCopy<$R, $Out> on ObjectCopyWith<$R, Profile, $Out> {
  ProfileCopyWith<$R, Profile, $Out> get $asProfile =>
      $base.as((v, t, t2) => _ProfileCopyWithImpl(v, t, t2));
}

abstract class ProfileCopyWith<$R, $In extends Profile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? no,
      String? name,
      String? email,
      String? desc,
      String? pic,
      DateTime? updated});
  ProfileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProfileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Profile, $Out>
    implements ProfileCopyWith<$R, Profile, $Out> {
  _ProfileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Profile> $mapper =
      ProfileMapper.ensureInitialized();
  @override
  $R call(
          {int? no,
          String? name,
          String? email,
          String? desc,
          String? pic,
          DateTime? updated}) =>
      $apply(FieldCopyWithData({
        if (no != null) #no: no,
        if (name != null) #name: name,
        if (email != null) #email: email,
        if (desc != null) #desc: desc,
        if (pic != null) #pic: pic,
        if (updated != null) #updated: updated
      }));
  @override
  Profile $make(CopyWithData data) => Profile(
      data.get(#no, or: $value.no),
      data.get(#name, or: $value.name),
      data.get(#email, or: $value.email),
      data.get(#desc, or: $value.desc),
      data.get(#pic, or: $value.pic),
      data.get(#updated, or: $value.updated));

  @override
  ProfileCopyWith<$R2, Profile, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProfileCopyWithImpl($value, $cast, t);
}

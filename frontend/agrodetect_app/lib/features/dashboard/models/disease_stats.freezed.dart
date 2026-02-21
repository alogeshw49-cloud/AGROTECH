// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiseaseStats {

 String get diseaseName; int get count;
/// Create a copy of DiseaseStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiseaseStatsCopyWith<DiseaseStats> get copyWith => _$DiseaseStatsCopyWithImpl<DiseaseStats>(this as DiseaseStats, _$identity);

  /// Serializes this DiseaseStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiseaseStats&&(identical(other.diseaseName, diseaseName) || other.diseaseName == diseaseName)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diseaseName,count);

@override
String toString() {
  return 'DiseaseStats(diseaseName: $diseaseName, count: $count)';
}


}

/// @nodoc
abstract mixin class $DiseaseStatsCopyWith<$Res>  {
  factory $DiseaseStatsCopyWith(DiseaseStats value, $Res Function(DiseaseStats) _then) = _$DiseaseStatsCopyWithImpl;
@useResult
$Res call({
 String diseaseName, int count
});




}
/// @nodoc
class _$DiseaseStatsCopyWithImpl<$Res>
    implements $DiseaseStatsCopyWith<$Res> {
  _$DiseaseStatsCopyWithImpl(this._self, this._then);

  final DiseaseStats _self;
  final $Res Function(DiseaseStats) _then;

/// Create a copy of DiseaseStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diseaseName = null,Object? count = null,}) {
  return _then(_self.copyWith(
diseaseName: null == diseaseName ? _self.diseaseName : diseaseName // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DiseaseStats].
extension DiseaseStatsPatterns on DiseaseStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiseaseStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiseaseStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiseaseStats value)  $default,){
final _that = this;
switch (_that) {
case _DiseaseStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiseaseStats value)?  $default,){
final _that = this;
switch (_that) {
case _DiseaseStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String diseaseName,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiseaseStats() when $default != null:
return $default(_that.diseaseName,_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String diseaseName,  int count)  $default,) {final _that = this;
switch (_that) {
case _DiseaseStats():
return $default(_that.diseaseName,_that.count);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String diseaseName,  int count)?  $default,) {final _that = this;
switch (_that) {
case _DiseaseStats() when $default != null:
return $default(_that.diseaseName,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiseaseStats implements DiseaseStats {
  const _DiseaseStats({required this.diseaseName, required this.count});
  factory _DiseaseStats.fromJson(Map<String, dynamic> json) => _$DiseaseStatsFromJson(json);

@override final  String diseaseName;
@override final  int count;

/// Create a copy of DiseaseStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiseaseStatsCopyWith<_DiseaseStats> get copyWith => __$DiseaseStatsCopyWithImpl<_DiseaseStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiseaseStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiseaseStats&&(identical(other.diseaseName, diseaseName) || other.diseaseName == diseaseName)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diseaseName,count);

@override
String toString() {
  return 'DiseaseStats(diseaseName: $diseaseName, count: $count)';
}


}

/// @nodoc
abstract mixin class _$DiseaseStatsCopyWith<$Res> implements $DiseaseStatsCopyWith<$Res> {
  factory _$DiseaseStatsCopyWith(_DiseaseStats value, $Res Function(_DiseaseStats) _then) = __$DiseaseStatsCopyWithImpl;
@override @useResult
$Res call({
 String diseaseName, int count
});




}
/// @nodoc
class __$DiseaseStatsCopyWithImpl<$Res>
    implements _$DiseaseStatsCopyWith<$Res> {
  __$DiseaseStatsCopyWithImpl(this._self, this._then);

  final _DiseaseStats _self;
  final $Res Function(_DiseaseStats) _then;

/// Create a copy of DiseaseStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diseaseName = null,Object? count = null,}) {
  return _then(_DiseaseStats(
diseaseName: null == diseaseName ? _self.diseaseName : diseaseName // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

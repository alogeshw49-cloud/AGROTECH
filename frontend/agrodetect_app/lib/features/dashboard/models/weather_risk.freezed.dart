// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_risk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherRisk {

 String get riskLevel;// Low, Moderate, High
 String get advice; double get temperature; double get humidity;
/// Create a copy of WeatherRisk
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherRiskCopyWith<WeatherRisk> get copyWith => _$WeatherRiskCopyWithImpl<WeatherRisk>(this as WeatherRisk, _$identity);

  /// Serializes this WeatherRisk to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherRisk&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,riskLevel,advice,temperature,humidity);

@override
String toString() {
  return 'WeatherRisk(riskLevel: $riskLevel, advice: $advice, temperature: $temperature, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class $WeatherRiskCopyWith<$Res>  {
  factory $WeatherRiskCopyWith(WeatherRisk value, $Res Function(WeatherRisk) _then) = _$WeatherRiskCopyWithImpl;
@useResult
$Res call({
 String riskLevel, String advice, double temperature, double humidity
});




}
/// @nodoc
class _$WeatherRiskCopyWithImpl<$Res>
    implements $WeatherRiskCopyWith<$Res> {
  _$WeatherRiskCopyWithImpl(this._self, this._then);

  final WeatherRisk _self;
  final $Res Function(WeatherRisk) _then;

/// Create a copy of WeatherRisk
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? riskLevel = null,Object? advice = null,Object? temperature = null,Object? humidity = null,}) {
  return _then(_self.copyWith(
riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,advice: null == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherRisk].
extension WeatherRiskPatterns on WeatherRisk {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherRisk value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherRisk() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherRisk value)  $default,){
final _that = this;
switch (_that) {
case _WeatherRisk():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherRisk value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherRisk() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String riskLevel,  String advice,  double temperature,  double humidity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherRisk() when $default != null:
return $default(_that.riskLevel,_that.advice,_that.temperature,_that.humidity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String riskLevel,  String advice,  double temperature,  double humidity)  $default,) {final _that = this;
switch (_that) {
case _WeatherRisk():
return $default(_that.riskLevel,_that.advice,_that.temperature,_that.humidity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String riskLevel,  String advice,  double temperature,  double humidity)?  $default,) {final _that = this;
switch (_that) {
case _WeatherRisk() when $default != null:
return $default(_that.riskLevel,_that.advice,_that.temperature,_that.humidity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherRisk implements WeatherRisk {
  const _WeatherRisk({required this.riskLevel, required this.advice, required this.temperature, required this.humidity});
  factory _WeatherRisk.fromJson(Map<String, dynamic> json) => _$WeatherRiskFromJson(json);

@override final  String riskLevel;
// Low, Moderate, High
@override final  String advice;
@override final  double temperature;
@override final  double humidity;

/// Create a copy of WeatherRisk
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherRiskCopyWith<_WeatherRisk> get copyWith => __$WeatherRiskCopyWithImpl<_WeatherRisk>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherRiskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherRisk&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,riskLevel,advice,temperature,humidity);

@override
String toString() {
  return 'WeatherRisk(riskLevel: $riskLevel, advice: $advice, temperature: $temperature, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class _$WeatherRiskCopyWith<$Res> implements $WeatherRiskCopyWith<$Res> {
  factory _$WeatherRiskCopyWith(_WeatherRisk value, $Res Function(_WeatherRisk) _then) = __$WeatherRiskCopyWithImpl;
@override @useResult
$Res call({
 String riskLevel, String advice, double temperature, double humidity
});




}
/// @nodoc
class __$WeatherRiskCopyWithImpl<$Res>
    implements _$WeatherRiskCopyWith<$Res> {
  __$WeatherRiskCopyWithImpl(this._self, this._then);

  final _WeatherRisk _self;
  final $Res Function(_WeatherRisk) _then;

/// Create a copy of WeatherRisk
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? riskLevel = null,Object? advice = null,Object? temperature = null,Object? humidity = null,}) {
  return _then(_WeatherRisk(
riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,advice: null == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

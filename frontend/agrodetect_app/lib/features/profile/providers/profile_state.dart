import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/profile.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  
  const factory ProfileState({
    @Default(true) bool isLoading,
    Profile? profile,
    String? error,
  }) = _ProfileState;
}

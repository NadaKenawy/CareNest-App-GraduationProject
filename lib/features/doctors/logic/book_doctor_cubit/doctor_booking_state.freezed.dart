// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorBookingState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() bookingLoading,
    required TResult Function(T data) bookingSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) bookingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? bookingLoading,
    TResult? Function(T data)? bookingSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? bookingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? bookingLoading,
    TResult Function(T data)? bookingSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? bookingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BookingLoading<T> value) bookingLoading,
    required TResult Function(BookingSuccess<T> value) bookingSuccess,
    required TResult Function(BookingError<T> value) bookingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BookingLoading<T> value)? bookingLoading,
    TResult? Function(BookingSuccess<T> value)? bookingSuccess,
    TResult? Function(BookingError<T> value)? bookingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BookingLoading<T> value)? bookingLoading,
    TResult Function(BookingSuccess<T> value)? bookingSuccess,
    TResult Function(BookingError<T> value)? bookingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorBookingStateCopyWith<T, $Res> {
  factory $DoctorBookingStateCopyWith(DoctorBookingState<T> value,
          $Res Function(DoctorBookingState<T>) then) =
      _$DoctorBookingStateCopyWithImpl<T, $Res, DoctorBookingState<T>>;
}

/// @nodoc
class _$DoctorBookingStateCopyWithImpl<T, $Res,
        $Val extends DoctorBookingState<T>>
    implements $DoctorBookingStateCopyWith<T, $Res> {
  _$DoctorBookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$DoctorBookingStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DoctorBookingState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() bookingLoading,
    required TResult Function(T data) bookingSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) bookingError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? bookingLoading,
    TResult? Function(T data)? bookingSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? bookingError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? bookingLoading,
    TResult Function(T data)? bookingSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? bookingError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BookingLoading<T> value) bookingLoading,
    required TResult Function(BookingSuccess<T> value) bookingSuccess,
    required TResult Function(BookingError<T> value) bookingError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BookingLoading<T> value)? bookingLoading,
    TResult? Function(BookingSuccess<T> value)? bookingSuccess,
    TResult? Function(BookingError<T> value)? bookingError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BookingLoading<T> value)? bookingLoading,
    TResult Function(BookingSuccess<T> value)? bookingSuccess,
    TResult Function(BookingError<T> value)? bookingError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements DoctorBookingState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$BookingLoadingImplCopyWith<T, $Res> {
  factory _$$BookingLoadingImplCopyWith(_$BookingLoadingImpl<T> value,
          $Res Function(_$BookingLoadingImpl<T>) then) =
      __$$BookingLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BookingLoadingImplCopyWithImpl<T, $Res>
    extends _$DoctorBookingStateCopyWithImpl<T, $Res, _$BookingLoadingImpl<T>>
    implements _$$BookingLoadingImplCopyWith<T, $Res> {
  __$$BookingLoadingImplCopyWithImpl(_$BookingLoadingImpl<T> _value,
      $Res Function(_$BookingLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BookingLoadingImpl<T> implements BookingLoading<T> {
  const _$BookingLoadingImpl();

  @override
  String toString() {
    return 'DoctorBookingState<$T>.bookingLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BookingLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() bookingLoading,
    required TResult Function(T data) bookingSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) bookingError,
  }) {
    return bookingLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? bookingLoading,
    TResult? Function(T data)? bookingSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? bookingError,
  }) {
    return bookingLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? bookingLoading,
    TResult Function(T data)? bookingSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? bookingError,
    required TResult orElse(),
  }) {
    if (bookingLoading != null) {
      return bookingLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BookingLoading<T> value) bookingLoading,
    required TResult Function(BookingSuccess<T> value) bookingSuccess,
    required TResult Function(BookingError<T> value) bookingError,
  }) {
    return bookingLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BookingLoading<T> value)? bookingLoading,
    TResult? Function(BookingSuccess<T> value)? bookingSuccess,
    TResult? Function(BookingError<T> value)? bookingError,
  }) {
    return bookingLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BookingLoading<T> value)? bookingLoading,
    TResult Function(BookingSuccess<T> value)? bookingSuccess,
    TResult Function(BookingError<T> value)? bookingError,
    required TResult orElse(),
  }) {
    if (bookingLoading != null) {
      return bookingLoading(this);
    }
    return orElse();
  }
}

abstract class BookingLoading<T> implements DoctorBookingState<T> {
  const factory BookingLoading() = _$BookingLoadingImpl<T>;
}

/// @nodoc
abstract class _$$BookingSuccessImplCopyWith<T, $Res> {
  factory _$$BookingSuccessImplCopyWith(_$BookingSuccessImpl<T> value,
          $Res Function(_$BookingSuccessImpl<T>) then) =
      __$$BookingSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$BookingSuccessImplCopyWithImpl<T, $Res>
    extends _$DoctorBookingStateCopyWithImpl<T, $Res, _$BookingSuccessImpl<T>>
    implements _$$BookingSuccessImplCopyWith<T, $Res> {
  __$$BookingSuccessImplCopyWithImpl(_$BookingSuccessImpl<T> _value,
      $Res Function(_$BookingSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BookingSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$BookingSuccessImpl<T> implements BookingSuccess<T> {
  const _$BookingSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DoctorBookingState<$T>.bookingSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingSuccessImplCopyWith<T, _$BookingSuccessImpl<T>> get copyWith =>
      __$$BookingSuccessImplCopyWithImpl<T, _$BookingSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() bookingLoading,
    required TResult Function(T data) bookingSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) bookingError,
  }) {
    return bookingSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? bookingLoading,
    TResult? Function(T data)? bookingSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? bookingError,
  }) {
    return bookingSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? bookingLoading,
    TResult Function(T data)? bookingSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? bookingError,
    required TResult orElse(),
  }) {
    if (bookingSuccess != null) {
      return bookingSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BookingLoading<T> value) bookingLoading,
    required TResult Function(BookingSuccess<T> value) bookingSuccess,
    required TResult Function(BookingError<T> value) bookingError,
  }) {
    return bookingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BookingLoading<T> value)? bookingLoading,
    TResult? Function(BookingSuccess<T> value)? bookingSuccess,
    TResult? Function(BookingError<T> value)? bookingError,
  }) {
    return bookingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BookingLoading<T> value)? bookingLoading,
    TResult Function(BookingSuccess<T> value)? bookingSuccess,
    TResult Function(BookingError<T> value)? bookingError,
    required TResult orElse(),
  }) {
    if (bookingSuccess != null) {
      return bookingSuccess(this);
    }
    return orElse();
  }
}

abstract class BookingSuccess<T> implements DoctorBookingState<T> {
  const factory BookingSuccess(final T data) = _$BookingSuccessImpl<T>;

  T get data;

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingSuccessImplCopyWith<T, _$BookingSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookingErrorImplCopyWith<T, $Res> {
  factory _$$BookingErrorImplCopyWith(_$BookingErrorImpl<T> value,
          $Res Function(_$BookingErrorImpl<T>) then) =
      __$$BookingErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$BookingErrorImplCopyWithImpl<T, $Res>
    extends _$DoctorBookingStateCopyWithImpl<T, $Res, _$BookingErrorImpl<T>>
    implements _$$BookingErrorImplCopyWith<T, $Res> {
  __$$BookingErrorImplCopyWithImpl(
      _$BookingErrorImpl<T> _value, $Res Function(_$BookingErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$BookingErrorImpl<T>(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$BookingErrorImpl<T> implements BookingError<T> {
  const _$BookingErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'DoctorBookingState<$T>.bookingError(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingErrorImpl<T> &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingErrorImplCopyWith<T, _$BookingErrorImpl<T>> get copyWith =>
      __$$BookingErrorImplCopyWithImpl<T, _$BookingErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() bookingLoading,
    required TResult Function(T data) bookingSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) bookingError,
  }) {
    return bookingError(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? bookingLoading,
    TResult? Function(T data)? bookingSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? bookingError,
  }) {
    return bookingError?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? bookingLoading,
    TResult Function(T data)? bookingSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? bookingError,
    required TResult orElse(),
  }) {
    if (bookingError != null) {
      return bookingError(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BookingLoading<T> value) bookingLoading,
    required TResult Function(BookingSuccess<T> value) bookingSuccess,
    required TResult Function(BookingError<T> value) bookingError,
  }) {
    return bookingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BookingLoading<T> value)? bookingLoading,
    TResult? Function(BookingSuccess<T> value)? bookingSuccess,
    TResult? Function(BookingError<T> value)? bookingError,
  }) {
    return bookingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BookingLoading<T> value)? bookingLoading,
    TResult Function(BookingSuccess<T> value)? bookingSuccess,
    TResult Function(BookingError<T> value)? bookingError,
    required TResult orElse(),
  }) {
    if (bookingError != null) {
      return bookingError(this);
    }
    return orElse();
  }
}

abstract class BookingError<T> implements DoctorBookingState<T> {
  const factory BookingError(final ApiErrorModel apiErrorModel) =
      _$BookingErrorImpl<T>;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of DoctorBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingErrorImplCopyWith<T, _$BookingErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorReviewState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reviewLoading,
    required TResult Function(T data) reviewSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reviewError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reviewLoading,
    TResult? Function(T data)? reviewSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reviewError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reviewLoading,
    TResult Function(T data)? reviewSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reviewError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ReviewLoading<T> value) reviewLoading,
    required TResult Function(ReviewSuccess<T> value) reviewSuccess,
    required TResult Function(ReviewError<T> value) reviewError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ReviewLoading<T> value)? reviewLoading,
    TResult? Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult? Function(ReviewError<T> value)? reviewError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ReviewLoading<T> value)? reviewLoading,
    TResult Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult Function(ReviewError<T> value)? reviewError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorReviewStateCopyWith<T, $Res> {
  factory $DoctorReviewStateCopyWith(DoctorReviewState<T> value,
          $Res Function(DoctorReviewState<T>) then) =
      _$DoctorReviewStateCopyWithImpl<T, $Res, DoctorReviewState<T>>;
}

/// @nodoc
class _$DoctorReviewStateCopyWithImpl<T, $Res,
        $Val extends DoctorReviewState<T>>
    implements $DoctorReviewStateCopyWith<T, $Res> {
  _$DoctorReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorReviewState
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
    extends _$DoctorReviewStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DoctorReviewState<$T>.initial()';
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
    required TResult Function() reviewLoading,
    required TResult Function(T data) reviewSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reviewError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reviewLoading,
    TResult? Function(T data)? reviewSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reviewError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reviewLoading,
    TResult Function(T data)? reviewSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reviewError,
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
    required TResult Function(ReviewLoading<T> value) reviewLoading,
    required TResult Function(ReviewSuccess<T> value) reviewSuccess,
    required TResult Function(ReviewError<T> value) reviewError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ReviewLoading<T> value)? reviewLoading,
    TResult? Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult? Function(ReviewError<T> value)? reviewError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ReviewLoading<T> value)? reviewLoading,
    TResult Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult Function(ReviewError<T> value)? reviewError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements DoctorReviewState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ReviewLoadingImplCopyWith<T, $Res> {
  factory _$$ReviewLoadingImplCopyWith(_$ReviewLoadingImpl<T> value,
          $Res Function(_$ReviewLoadingImpl<T>) then) =
      __$$ReviewLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ReviewLoadingImplCopyWithImpl<T, $Res>
    extends _$DoctorReviewStateCopyWithImpl<T, $Res, _$ReviewLoadingImpl<T>>
    implements _$$ReviewLoadingImplCopyWith<T, $Res> {
  __$$ReviewLoadingImplCopyWithImpl(_$ReviewLoadingImpl<T> _value,
      $Res Function(_$ReviewLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReviewLoadingImpl<T> implements ReviewLoading<T> {
  const _$ReviewLoadingImpl();

  @override
  String toString() {
    return 'DoctorReviewState<$T>.reviewLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReviewLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reviewLoading,
    required TResult Function(T data) reviewSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reviewError,
  }) {
    return reviewLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reviewLoading,
    TResult? Function(T data)? reviewSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reviewError,
  }) {
    return reviewLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reviewLoading,
    TResult Function(T data)? reviewSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reviewError,
    required TResult orElse(),
  }) {
    if (reviewLoading != null) {
      return reviewLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ReviewLoading<T> value) reviewLoading,
    required TResult Function(ReviewSuccess<T> value) reviewSuccess,
    required TResult Function(ReviewError<T> value) reviewError,
  }) {
    return reviewLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ReviewLoading<T> value)? reviewLoading,
    TResult? Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult? Function(ReviewError<T> value)? reviewError,
  }) {
    return reviewLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ReviewLoading<T> value)? reviewLoading,
    TResult Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult Function(ReviewError<T> value)? reviewError,
    required TResult orElse(),
  }) {
    if (reviewLoading != null) {
      return reviewLoading(this);
    }
    return orElse();
  }
}

abstract class ReviewLoading<T> implements DoctorReviewState<T> {
  const factory ReviewLoading() = _$ReviewLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ReviewSuccessImplCopyWith<T, $Res> {
  factory _$$ReviewSuccessImplCopyWith(_$ReviewSuccessImpl<T> value,
          $Res Function(_$ReviewSuccessImpl<T>) then) =
      __$$ReviewSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ReviewSuccessImplCopyWithImpl<T, $Res>
    extends _$DoctorReviewStateCopyWithImpl<T, $Res, _$ReviewSuccessImpl<T>>
    implements _$$ReviewSuccessImplCopyWith<T, $Res> {
  __$$ReviewSuccessImplCopyWithImpl(_$ReviewSuccessImpl<T> _value,
      $Res Function(_$ReviewSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ReviewSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ReviewSuccessImpl<T> implements ReviewSuccess<T> {
  const _$ReviewSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DoctorReviewState<$T>.reviewSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewSuccessImplCopyWith<T, _$ReviewSuccessImpl<T>> get copyWith =>
      __$$ReviewSuccessImplCopyWithImpl<T, _$ReviewSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reviewLoading,
    required TResult Function(T data) reviewSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reviewError,
  }) {
    return reviewSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reviewLoading,
    TResult? Function(T data)? reviewSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reviewError,
  }) {
    return reviewSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reviewLoading,
    TResult Function(T data)? reviewSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reviewError,
    required TResult orElse(),
  }) {
    if (reviewSuccess != null) {
      return reviewSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ReviewLoading<T> value) reviewLoading,
    required TResult Function(ReviewSuccess<T> value) reviewSuccess,
    required TResult Function(ReviewError<T> value) reviewError,
  }) {
    return reviewSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ReviewLoading<T> value)? reviewLoading,
    TResult? Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult? Function(ReviewError<T> value)? reviewError,
  }) {
    return reviewSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ReviewLoading<T> value)? reviewLoading,
    TResult Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult Function(ReviewError<T> value)? reviewError,
    required TResult orElse(),
  }) {
    if (reviewSuccess != null) {
      return reviewSuccess(this);
    }
    return orElse();
  }
}

abstract class ReviewSuccess<T> implements DoctorReviewState<T> {
  const factory ReviewSuccess(final T data) = _$ReviewSuccessImpl<T>;

  T get data;

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewSuccessImplCopyWith<T, _$ReviewSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReviewErrorImplCopyWith<T, $Res> {
  factory _$$ReviewErrorImplCopyWith(_$ReviewErrorImpl<T> value,
          $Res Function(_$ReviewErrorImpl<T>) then) =
      __$$ReviewErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$ReviewErrorImplCopyWithImpl<T, $Res>
    extends _$DoctorReviewStateCopyWithImpl<T, $Res, _$ReviewErrorImpl<T>>
    implements _$$ReviewErrorImplCopyWith<T, $Res> {
  __$$ReviewErrorImplCopyWithImpl(
      _$ReviewErrorImpl<T> _value, $Res Function(_$ReviewErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$ReviewErrorImpl<T>(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ReviewErrorImpl<T> implements ReviewError<T> {
  const _$ReviewErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'DoctorReviewState<$T>.reviewError(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewErrorImpl<T> &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewErrorImplCopyWith<T, _$ReviewErrorImpl<T>> get copyWith =>
      __$$ReviewErrorImplCopyWithImpl<T, _$ReviewErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reviewLoading,
    required TResult Function(T data) reviewSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reviewError,
  }) {
    return reviewError(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reviewLoading,
    TResult? Function(T data)? reviewSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reviewError,
  }) {
    return reviewError?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reviewLoading,
    TResult Function(T data)? reviewSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reviewError,
    required TResult orElse(),
  }) {
    if (reviewError != null) {
      return reviewError(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ReviewLoading<T> value) reviewLoading,
    required TResult Function(ReviewSuccess<T> value) reviewSuccess,
    required TResult Function(ReviewError<T> value) reviewError,
  }) {
    return reviewError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ReviewLoading<T> value)? reviewLoading,
    TResult? Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult? Function(ReviewError<T> value)? reviewError,
  }) {
    return reviewError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ReviewLoading<T> value)? reviewLoading,
    TResult Function(ReviewSuccess<T> value)? reviewSuccess,
    TResult Function(ReviewError<T> value)? reviewError,
    required TResult orElse(),
  }) {
    if (reviewError != null) {
      return reviewError(this);
    }
    return orElse();
  }
}

abstract class ReviewError<T> implements DoctorReviewState<T> {
  const factory ReviewError(final ApiErrorModel apiErrorModel) =
      _$ReviewErrorImpl<T>;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of DoctorReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewErrorImplCopyWith<T, _$ReviewErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

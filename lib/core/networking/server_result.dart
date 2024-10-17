import 'package:care_nest/core/networking/server_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'server_result.freezed.dart';
@Freezed()
abstract class ServerResult<T> with _$ServerResult<T> {
  const factory ServerResult.success(T data) = Success<T>;
  const factory ServerResult.failure(ServerErrorHandler serverErrorHandler) =
      Failure<T>;
}

// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'employee_login_bloc.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

// /// @nodoc
// mixin _$EmployeeLoginEvent {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() started,
//     required TResult Function(String email, String password) loggedIn,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? started,
//     TResult? Function(String email, String password)? loggedIn,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? started,
//     TResult Function(String email, String password)? loggedIn,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Started value) started,
//     required TResult Function(_loggedIn value) loggedIn,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Started value)? started,
//     TResult? Function(_loggedIn value)? loggedIn,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Started value)? started,
//     TResult Function(_loggedIn value)? loggedIn,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $EmployeeLoginEventCopyWith<$Res> {
//   factory $EmployeeLoginEventCopyWith(
//           EmployeeLoginEvent value, $Res Function(EmployeeLoginEvent) then) =
//       _$EmployeeLoginEventCopyWithImpl<$Res, EmployeeLoginEvent>;
// }

// /// @nodoc
// class _$EmployeeLoginEventCopyWithImpl<$Res, $Val extends EmployeeLoginEvent>
//     implements $EmployeeLoginEventCopyWith<$Res> {
//   _$EmployeeLoginEventCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   /// Create a copy of EmployeeLoginEvent
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc
// abstract class _$$StartedImplCopyWith<$Res> {
//   factory _$$StartedImplCopyWith(
//           _$StartedImpl value, $Res Function(_$StartedImpl) then) =
//       __$$StartedImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$StartedImplCopyWithImpl<$Res>
//     extends _$EmployeeLoginEventCopyWithImpl<$Res, _$StartedImpl>
//     implements _$$StartedImplCopyWith<$Res> {
//   __$$StartedImplCopyWithImpl(
//       _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of EmployeeLoginEvent
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc

// class _$StartedImpl implements _Started {
//   const _$StartedImpl();

//   @override
//   String toString() {
//     return 'EmployeeLoginEvent.started()';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$StartedImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() started,
//     required TResult Function(String email, String password) loggedIn,
//   }) {
//     return started();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? started,
//     TResult? Function(String email, String password)? loggedIn,
//   }) {
//     return started?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? started,
//     TResult Function(String email, String password)? loggedIn,
//     required TResult orElse(),
//   }) {
//     if (started != null) {
//       return started();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Started value) started,
//     required TResult Function(_loggedIn value) loggedIn,
//   }) {
//     return started(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Started value)? started,
//     TResult? Function(_loggedIn value)? loggedIn,
//   }) {
//     return started?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Started value)? started,
//     TResult Function(_loggedIn value)? loggedIn,
//     required TResult orElse(),
//   }) {
//     if (started != null) {
//       return started(this);
//     }
//     return orElse();
//   }
// }

// abstract class _Started implements EmployeeLoginEvent {
//   const factory _Started() = _$StartedImpl;
// }

// /// @nodoc
// abstract class _$$loggedInImplCopyWith<$Res> {
//   factory _$$loggedInImplCopyWith(
//           _$loggedInImpl value, $Res Function(_$loggedInImpl) then) =
//       __$$loggedInImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({String email, String password});
// }

// /// @nodoc
// class __$$loggedInImplCopyWithImpl<$Res>
//     extends _$EmployeeLoginEventCopyWithImpl<$Res, _$loggedInImpl>
//     implements _$$loggedInImplCopyWith<$Res> {
//   __$$loggedInImplCopyWithImpl(
//       _$loggedInImpl _value, $Res Function(_$loggedInImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of EmployeeLoginEvent
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? email = null,
//     Object? password = null,
//   }) {
//     return _then(_$loggedInImpl(
//       null == email
//           ? _value.email
//           : email // ignore: cast_nullable_to_non_nullable
//               as String,
//       null == password
//           ? _value.password
//           : password // ignore: cast_nullable_to_non_nullable
//               as String,
//     ));
//   }
// }

// /// @nodoc

// class _$loggedInImpl implements _loggedIn {
//   const _$loggedInImpl(this.email, this.password);

//   @override
//   final String email;
//   @override
//   final String password;

//   @override
//   String toString() {
//     return 'EmployeeLoginEvent.loggedIn(email: $email, password: $password)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$loggedInImpl &&
//             (identical(other.email, email) || other.email == email) &&
//             (identical(other.password, password) ||
//                 other.password == password));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, email, password);

//   /// Create a copy of EmployeeLoginEvent
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$loggedInImplCopyWith<_$loggedInImpl> get copyWith =>
//       __$$loggedInImplCopyWithImpl<_$loggedInImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() started,
//     required TResult Function(String email, String password) loggedIn,
//   }) {
//     return loggedIn(email, password);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? started,
//     TResult? Function(String email, String password)? loggedIn,
//   }) {
//     return loggedIn?.call(email, password);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? started,
//     TResult Function(String email, String password)? loggedIn,
//     required TResult orElse(),
//   }) {
//     if (loggedIn != null) {
//       return loggedIn(email, password);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Started value) started,
//     required TResult Function(_loggedIn value) loggedIn,
//   }) {
//     return loggedIn(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Started value)? started,
//     TResult? Function(_loggedIn value)? loggedIn,
//   }) {
//     return loggedIn?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Started value)? started,
//     TResult Function(_loggedIn value)? loggedIn,
//     required TResult orElse(),
//   }) {
//     if (loggedIn != null) {
//       return loggedIn(this);
//     }
//     return orElse();
//   }
// }

// abstract class _loggedIn implements EmployeeLoginEvent {
//   const factory _loggedIn(final String email, final String password) =
//       _$loggedInImpl;

//   String get email;
//   String get password;

//   /// Create a copy of EmployeeLoginEvent
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$loggedInImplCopyWith<_$loggedInImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// mixin _$EmployeeLoginState {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function() loading,
//     required TResult Function(EmployeeLoginModel response) success,
//     required TResult Function(String error) failed,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function()? loading,
//     TResult? Function(EmployeeLoginModel response)? success,
//     TResult? Function(String error)? failed,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function()? loading,
//     TResult Function(EmployeeLoginModel response)? success,
//     TResult Function(String error)? failed,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Initial value) initial,
//     required TResult Function(_loading value) loading,
//     required TResult Function(_success value) success,
//     required TResult Function(_failed value) failed,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Initial value)? initial,
//     TResult? Function(_loading value)? loading,
//     TResult? Function(_success value)? success,
//     TResult? Function(_failed value)? failed,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Initial value)? initial,
//     TResult Function(_loading value)? loading,
//     TResult Function(_success value)? success,
//     TResult Function(_failed value)? failed,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $EmployeeLoginStateCopyWith<$Res> {
//   factory $EmployeeLoginStateCopyWith(
//           EmployeeLoginState value, $Res Function(EmployeeLoginState) then) =
//       _$EmployeeLoginStateCopyWithImpl<$Res, EmployeeLoginState>;
// }

// /// @nodoc
// class _$EmployeeLoginStateCopyWithImpl<$Res, $Val extends EmployeeLoginState>
//     implements $EmployeeLoginStateCopyWith<$Res> {
//   _$EmployeeLoginStateCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc
// abstract class _$$InitialImplCopyWith<$Res> {
//   factory _$$InitialImplCopyWith(
//           _$InitialImpl value, $Res Function(_$InitialImpl) then) =
//       __$$InitialImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$InitialImplCopyWithImpl<$Res>
//     extends _$EmployeeLoginStateCopyWithImpl<$Res, _$InitialImpl>
//     implements _$$InitialImplCopyWith<$Res> {
//   __$$InitialImplCopyWithImpl(
//       _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc

// class _$InitialImpl implements _Initial {
//   const _$InitialImpl();

//   @override
//   String toString() {
//     return 'EmployeeLoginState.initial()';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$InitialImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function() loading,
//     required TResult Function(EmployeeLoginModel response) success,
//     required TResult Function(String error) failed,
//   }) {
//     return initial();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function()? loading,
//     TResult? Function(EmployeeLoginModel response)? success,
//     TResult? Function(String error)? failed,
//   }) {
//     return initial?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function()? loading,
//     TResult Function(EmployeeLoginModel response)? success,
//     TResult Function(String error)? failed,
//     required TResult orElse(),
//   }) {
//     if (initial != null) {
//       return initial();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Initial value) initial,
//     required TResult Function(_loading value) loading,
//     required TResult Function(_success value) success,
//     required TResult Function(_failed value) failed,
//   }) {
//     return initial(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Initial value)? initial,
//     TResult? Function(_loading value)? loading,
//     TResult? Function(_success value)? success,
//     TResult? Function(_failed value)? failed,
//   }) {
//     return initial?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Initial value)? initial,
//     TResult Function(_loading value)? loading,
//     TResult Function(_success value)? success,
//     TResult Function(_failed value)? failed,
//     required TResult orElse(),
//   }) {
//     if (initial != null) {
//       return initial(this);
//     }
//     return orElse();
//   }
// }

// abstract class _Initial implements EmployeeLoginState {
//   const factory _Initial() = _$InitialImpl;
// }

// /// @nodoc
// abstract class _$$loadingImplCopyWith<$Res> {
//   factory _$$loadingImplCopyWith(
//           _$loadingImpl value, $Res Function(_$loadingImpl) then) =
//       __$$loadingImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$loadingImplCopyWithImpl<$Res>
//     extends _$EmployeeLoginStateCopyWithImpl<$Res, _$loadingImpl>
//     implements _$$loadingImplCopyWith<$Res> {
//   __$$loadingImplCopyWithImpl(
//       _$loadingImpl _value, $Res Function(_$loadingImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc

// class _$loadingImpl implements _loading {
//   const _$loadingImpl();

//   @override
//   String toString() {
//     return 'EmployeeLoginState.loading()';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$loadingImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function() loading,
//     required TResult Function(EmployeeLoginModel response) success,
//     required TResult Function(String error) failed,
//   }) {
//     return loading();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function()? loading,
//     TResult? Function(EmployeeLoginModel response)? success,
//     TResult? Function(String error)? failed,
//   }) {
//     return loading?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function()? loading,
//     TResult Function(EmployeeLoginModel response)? success,
//     TResult Function(String error)? failed,
//     required TResult orElse(),
//   }) {
//     if (loading != null) {
//       return loading();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Initial value) initial,
//     required TResult Function(_loading value) loading,
//     required TResult Function(_success value) success,
//     required TResult Function(_failed value) failed,
//   }) {
//     return loading(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Initial value)? initial,
//     TResult? Function(_loading value)? loading,
//     TResult? Function(_success value)? success,
//     TResult? Function(_failed value)? failed,
//   }) {
//     return loading?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Initial value)? initial,
//     TResult Function(_loading value)? loading,
//     TResult Function(_success value)? success,
//     TResult Function(_failed value)? failed,
//     required TResult orElse(),
//   }) {
//     if (loading != null) {
//       return loading(this);
//     }
//     return orElse();
//   }
// }

// abstract class _loading implements EmployeeLoginState {
//   const factory _loading() = _$loadingImpl;
// }

// /// @nodoc
// abstract class _$$successImplCopyWith<$Res> {
//   factory _$$successImplCopyWith(
//           _$successImpl value, $Res Function(_$successImpl) then) =
//       __$$successImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({EmployeeLoginModel response});
// }

// /// @nodoc
// class __$$successImplCopyWithImpl<$Res>
//     extends _$EmployeeLoginStateCopyWithImpl<$Res, _$successImpl>
//     implements _$$successImplCopyWith<$Res> {
//   __$$successImplCopyWithImpl(
//       _$successImpl _value, $Res Function(_$successImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? response = null,
//   }) {
//     return _then(_$successImpl(
//       null == response
//           ? _value.response
//           : response // ignore: cast_nullable_to_non_nullable
//               as EmployeeLoginModel,
//     ));
//   }
// }

// /// @nodoc

// class _$successImpl implements _success {
//   const _$successImpl(this.response);

//   @override
//   final EmployeeLoginModel response;

//   @override
//   String toString() {
//     return 'EmployeeLoginState.success(response: $response)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$successImpl &&
//             (identical(other.response, response) ||
//                 other.response == response));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, response);

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$successImplCopyWith<_$successImpl> get copyWith =>
//       __$$successImplCopyWithImpl<_$successImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function() loading,
//     required TResult Function(EmployeeLoginModel response) success,
//     required TResult Function(String error) failed,
//   }) {
//     return success(response);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function()? loading,
//     TResult? Function(EmployeeLoginModel response)? success,
//     TResult? Function(String error)? failed,
//   }) {
//     return success?.call(response);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function()? loading,
//     TResult Function(EmployeeLoginModel response)? success,
//     TResult Function(String error)? failed,
//     required TResult orElse(),
//   }) {
//     if (success != null) {
//       return success(response);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Initial value) initial,
//     required TResult Function(_loading value) loading,
//     required TResult Function(_success value) success,
//     required TResult Function(_failed value) failed,
//   }) {
//     return success(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Initial value)? initial,
//     TResult? Function(_loading value)? loading,
//     TResult? Function(_success value)? success,
//     TResult? Function(_failed value)? failed,
//   }) {
//     return success?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Initial value)? initial,
//     TResult Function(_loading value)? loading,
//     TResult Function(_success value)? success,
//     TResult Function(_failed value)? failed,
//     required TResult orElse(),
//   }) {
//     if (success != null) {
//       return success(this);
//     }
//     return orElse();
//   }
// }

// abstract class _success implements EmployeeLoginState {
//   const factory _success(final EmployeeLoginModel response) = _$successImpl;

//   EmployeeLoginModel get response;

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$successImplCopyWith<_$successImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$failedImplCopyWith<$Res> {
//   factory _$$failedImplCopyWith(
//           _$failedImpl value, $Res Function(_$failedImpl) then) =
//       __$$failedImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({String error});
// }

// /// @nodoc
// class __$$failedImplCopyWithImpl<$Res>
//     extends _$EmployeeLoginStateCopyWithImpl<$Res, _$failedImpl>
//     implements _$$failedImplCopyWith<$Res> {
//   __$$failedImplCopyWithImpl(
//       _$failedImpl _value, $Res Function(_$failedImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? error = null,
//   }) {
//     return _then(_$failedImpl(
//       null == error
//           ? _value.error
//           : error // ignore: cast_nullable_to_non_nullable
//               as String,
//     ));
//   }
// }

// /// @nodoc

// class _$failedImpl implements _failed {
//   const _$failedImpl(this.error);

//   @override
//   final String error;

//   @override
//   String toString() {
//     return 'EmployeeLoginState.failed(error: $error)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$failedImpl &&
//             (identical(other.error, error) || other.error == error));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, error);

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$failedImplCopyWith<_$failedImpl> get copyWith =>
//       __$$failedImplCopyWithImpl<_$failedImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() initial,
//     required TResult Function() loading,
//     required TResult Function(EmployeeLoginModel response) success,
//     required TResult Function(String error) failed,
//   }) {
//     return failed(error);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? initial,
//     TResult? Function()? loading,
//     TResult? Function(EmployeeLoginModel response)? success,
//     TResult? Function(String error)? failed,
//   }) {
//     return failed?.call(error);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? initial,
//     TResult Function()? loading,
//     TResult Function(EmployeeLoginModel response)? success,
//     TResult Function(String error)? failed,
//     required TResult orElse(),
//   }) {
//     if (failed != null) {
//       return failed(error);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_Initial value) initial,
//     required TResult Function(_loading value) loading,
//     required TResult Function(_success value) success,
//     required TResult Function(_failed value) failed,
//   }) {
//     return failed(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_Initial value)? initial,
//     TResult? Function(_loading value)? loading,
//     TResult? Function(_success value)? success,
//     TResult? Function(_failed value)? failed,
//   }) {
//     return failed?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_Initial value)? initial,
//     TResult Function(_loading value)? loading,
//     TResult Function(_success value)? success,
//     TResult Function(_failed value)? failed,
//     required TResult orElse(),
//   }) {
//     if (failed != null) {
//       return failed(this);
//     }
//     return orElse();
//   }
// }

// abstract class _failed implements EmployeeLoginState {
//   const factory _failed(final String error) = _$failedImpl;

//   String get error;

//   /// Create a copy of EmployeeLoginState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$failedImplCopyWith<_$failedImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _SigningInAdmin value)?  signingInAdmin,TResult Function( _SigningInUser value)?  signingInUser,TResult Function( _GettingSignedInUser value)?  gettingSignedInUser,TResult Function( _Success value)?  success,TResult Function( _ErrorSigningInAdmin value)?  errorSigningInAdmin,TResult Function( _ErrorSigningInSigningInUser value)?  errorSigningInUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SigningInAdmin() when signingInAdmin != null:
return signingInAdmin(_that);case _SigningInUser() when signingInUser != null:
return signingInUser(_that);case _GettingSignedInUser() when gettingSignedInUser != null:
return gettingSignedInUser(_that);case _Success() when success != null:
return success(_that);case _ErrorSigningInAdmin() when errorSigningInAdmin != null:
return errorSigningInAdmin(_that);case _ErrorSigningInSigningInUser() when errorSigningInUser != null:
return errorSigningInUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _SigningInAdmin value)  signingInAdmin,required TResult Function( _SigningInUser value)  signingInUser,required TResult Function( _GettingSignedInUser value)  gettingSignedInUser,required TResult Function( _Success value)  success,required TResult Function( _ErrorSigningInAdmin value)  errorSigningInAdmin,required TResult Function( _ErrorSigningInSigningInUser value)  errorSigningInUser,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _SigningInAdmin():
return signingInAdmin(_that);case _SigningInUser():
return signingInUser(_that);case _GettingSignedInUser():
return gettingSignedInUser(_that);case _Success():
return success(_that);case _ErrorSigningInAdmin():
return errorSigningInAdmin(_that);case _ErrorSigningInSigningInUser():
return errorSigningInUser(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _SigningInAdmin value)?  signingInAdmin,TResult? Function( _SigningInUser value)?  signingInUser,TResult? Function( _GettingSignedInUser value)?  gettingSignedInUser,TResult? Function( _Success value)?  success,TResult? Function( _ErrorSigningInAdmin value)?  errorSigningInAdmin,TResult? Function( _ErrorSigningInSigningInUser value)?  errorSigningInUser,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SigningInAdmin() when signingInAdmin != null:
return signingInAdmin(_that);case _SigningInUser() when signingInUser != null:
return signingInUser(_that);case _GettingSignedInUser() when gettingSignedInUser != null:
return gettingSignedInUser(_that);case _Success() when success != null:
return success(_that);case _ErrorSigningInAdmin() when errorSigningInAdmin != null:
return errorSigningInAdmin(_that);case _ErrorSigningInSigningInUser() when errorSigningInUser != null:
return errorSigningInUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  signingInAdmin,TResult Function()?  signingInUser,TResult Function()?  gettingSignedInUser,TResult Function( User user)?  success,TResult Function( String message)?  errorSigningInAdmin,TResult Function( String message)?  errorSigningInUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SigningInAdmin() when signingInAdmin != null:
return signingInAdmin();case _SigningInUser() when signingInUser != null:
return signingInUser();case _GettingSignedInUser() when gettingSignedInUser != null:
return gettingSignedInUser();case _Success() when success != null:
return success(_that.user);case _ErrorSigningInAdmin() when errorSigningInAdmin != null:
return errorSigningInAdmin(_that.message);case _ErrorSigningInSigningInUser() when errorSigningInUser != null:
return errorSigningInUser(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  signingInAdmin,required TResult Function()  signingInUser,required TResult Function()  gettingSignedInUser,required TResult Function( User user)  success,required TResult Function( String message)  errorSigningInAdmin,required TResult Function( String message)  errorSigningInUser,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _SigningInAdmin():
return signingInAdmin();case _SigningInUser():
return signingInUser();case _GettingSignedInUser():
return gettingSignedInUser();case _Success():
return success(_that.user);case _ErrorSigningInAdmin():
return errorSigningInAdmin(_that.message);case _ErrorSigningInSigningInUser():
return errorSigningInUser(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  signingInAdmin,TResult? Function()?  signingInUser,TResult? Function()?  gettingSignedInUser,TResult? Function( User user)?  success,TResult? Function( String message)?  errorSigningInAdmin,TResult? Function( String message)?  errorSigningInUser,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SigningInAdmin() when signingInAdmin != null:
return signingInAdmin();case _SigningInUser() when signingInUser != null:
return signingInUser();case _GettingSignedInUser() when gettingSignedInUser != null:
return gettingSignedInUser();case _Success() when success != null:
return success(_that.user);case _ErrorSigningInAdmin() when errorSigningInAdmin != null:
return errorSigningInAdmin(_that.message);case _ErrorSigningInSigningInUser() when errorSigningInUser != null:
return errorSigningInUser(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _SigningInAdmin implements AuthState {
  const _SigningInAdmin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigningInAdmin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.signingInAdmin()';
}


}




/// @nodoc


class _SigningInUser implements AuthState {
  const _SigningInUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigningInUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.signingInUser()';
}


}




/// @nodoc


class _GettingSignedInUser implements AuthState {
  const _GettingSignedInUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GettingSignedInUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.gettingSignedInUser()';
}


}




/// @nodoc


class _Success implements AuthState {
  const _Success(this.user);
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.success(user: $user)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 User user
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Success(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class _ErrorSigningInAdmin implements AuthState {
  const _ErrorSigningInAdmin(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorSigningInAdminCopyWith<_ErrorSigningInAdmin> get copyWith => __$ErrorSigningInAdminCopyWithImpl<_ErrorSigningInAdmin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorSigningInAdmin&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.errorSigningInAdmin(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorSigningInAdminCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorSigningInAdminCopyWith(_ErrorSigningInAdmin value, $Res Function(_ErrorSigningInAdmin) _then) = __$ErrorSigningInAdminCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorSigningInAdminCopyWithImpl<$Res>
    implements _$ErrorSigningInAdminCopyWith<$Res> {
  __$ErrorSigningInAdminCopyWithImpl(this._self, this._then);

  final _ErrorSigningInAdmin _self;
  final $Res Function(_ErrorSigningInAdmin) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorSigningInAdmin(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ErrorSigningInSigningInUser implements AuthState {
  const _ErrorSigningInSigningInUser(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorSigningInSigningInUserCopyWith<_ErrorSigningInSigningInUser> get copyWith => __$ErrorSigningInSigningInUserCopyWithImpl<_ErrorSigningInSigningInUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorSigningInSigningInUser&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.errorSigningInUser(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorSigningInSigningInUserCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorSigningInSigningInUserCopyWith(_ErrorSigningInSigningInUser value, $Res Function(_ErrorSigningInSigningInUser) _then) = __$ErrorSigningInSigningInUserCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorSigningInSigningInUserCopyWithImpl<$Res>
    implements _$ErrorSigningInSigningInUserCopyWith<$Res> {
  __$ErrorSigningInSigningInUserCopyWithImpl(this._self, this._then);

  final _ErrorSigningInSigningInUser _self;
  final $Res Function(_ErrorSigningInSigningInUser) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorSigningInSigningInUser(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

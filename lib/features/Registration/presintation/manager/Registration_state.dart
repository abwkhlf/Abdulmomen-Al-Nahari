part of 'Registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class SinupInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class SinupLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class SinupLoaded extends RegistrationState {
  RegistrationModel registrationModel;
  SinupLoaded({required this.registrationModel});

  @override
  List<Object> get props => [RegistrationModel];
}

class SinupError extends RegistrationState {
  String errorMessage;

  SinupError({required this.errorMessage});

  @override
  List<Object> get props => [];
}


class loginInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class loginLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class loginLoaded extends RegistrationState {
  RegistrationModel registrationModel;
  loginLoaded({required this.registrationModel});

  @override
  List<Object> get props => [RegistrationModel];
}

class loginError extends RegistrationState {
  String errorMessage;

  loginError({required this.errorMessage});

  @override
  List<Object> get props => [];
}
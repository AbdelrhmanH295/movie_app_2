import 'package:equatable/equatable.dart';

abstract class ProfileUpdateState extends Equatable {
  const ProfileUpdateState();

  @override
  List<Object> get props => [];
}

class ProfileUpdateInitial extends ProfileUpdateState {
  final String username;
  final String phoneNumber;
  final String avatarPath;

  const ProfileUpdateInitial({
    required this.username,
    required this.phoneNumber,
    required this.avatarPath,
  });

  @override
  List<Object> get props => [username, phoneNumber, avatarPath];
}

class ProfileUpdateLoading extends ProfileUpdateState {}

class ProfileUpdateSuccess extends ProfileUpdateState {
  final String message;
  const ProfileUpdateSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class ProfileUpdateFailure extends ProfileUpdateState {
  final String error;
  const ProfileUpdateFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class ProfileUpdateAvatarChanged extends ProfileUpdateState {
  final String avatarPath;

  const ProfileUpdateAvatarChanged(this.avatarPath);

  @override
  List<Object> get props => [avatarPath];
}

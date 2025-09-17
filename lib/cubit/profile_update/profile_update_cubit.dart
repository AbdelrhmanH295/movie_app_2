import 'package:bloc/bloc.dart';
import 'package:movie_app/cubit/profile_update/profile_update_states.dart';
import 'package:movie_app/utils/app_assets.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateState> {
  ProfileUpdateCubit()
      : super(const ProfileUpdateInitial(
          username: 'John',
          phoneNumber: '01000000000',
          avatarPath: AppAssets.gamer1,
        ));
  String? selectedAvatar;
  void selectAvatar(String avatarPath) {
    selectedAvatar = avatarPath;
    emit(ProfileUpdateAvatarChanged(avatarPath));
  }

  void resetProfile() {
    emit(const ProfileUpdateInitial(
      username: "John Safwat",
      phoneNumber: "01200000000000",
      avatarPath: AppAssets.gamer1,
    ));
  }
}

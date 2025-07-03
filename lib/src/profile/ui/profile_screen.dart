import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_bloc/core/services/sharepref/share_pref.dart';
import 'package:project_bloc/src/profile/bloc/profile_bloc.dart';
import 'package:project_bloc/src/profile/model/profile_model.dart';
import '../../../core/injection/injection_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = locator<PrefHelper>().getUserToken();
    Fluttertoast.showToast(msg: userId.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context
                  .read<ProfileBloc>()
                  .add(FetchProfileEvent(userId.toString()));
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            ProfileBloc()..add(FetchProfileEvent(userId.toString())),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded || state is ProfileUpdated) {
              final profile = (state as dynamic).profile;
              return _buildProfileView(context, profile);
            }
            return const Center(child: Text('No profile data available'));
          },
        ),
      ),
    );
  }

  Widget _buildProfileView(BuildContext context, ProfileModel profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: profile.profilePicture != null
                  ? NetworkImage(profile.profilePicture!)
                  : const AssetImage('assets/default_avatar.png')
                      as ImageProvider,
            ),
          ),
          const SizedBox(height: 24),
          _buildProfileItem('Full Name', profile.fullName),
          _buildProfileItem('Email', profile.email),
          _buildProfileItem('Phone', profile.phoneNumber),
          _buildProfileItem('Gender', profile.gender),
          _buildProfileItem('Member Since',
              '${profile.createdAt.day}/${profile.createdAt.month}/${profile.createdAt.year}'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Example of updating profile
              context.read<ProfileBloc>().add(
                    UpdateProfileEvent(
                      ProfileModel(
                        profileId: profile.profileId,
                        createdAt: profile.createdAt,
                        fullName: 'Updated ${profile.fullName}',
                        phoneNumber: profile.phoneNumber,
                        email: profile.email,
                        profilePicture: profile.profilePicture,
                        gender: profile.gender,
                      ),
                    ),
                  );
            },
            child: const Text('Update Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

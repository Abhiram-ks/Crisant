import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/core/cloudinary/cloudinary_servide.dart';
import 'package:crisent_pannel/features/domain/entity/createuser_entity.dart';
import 'package:crisent_pannel/features/domain/repo/create_user_repo.dart';
import 'package:flutter/material.dart';
part 'createuser_event.dart';
part 'createuser_state.dart';

class CreateuserBloc extends Bloc<CreateuserEvent, CreateuserState> {
  final CloudinaryService _cloudinaryService;
  final CreateuserRepository _repository;
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _image = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get image => _image;

  CreateuserBloc( this._cloudinaryService, this._repository) : super(CreateuserInitiaState()) {
    on<CreateUserRequest>((event, emit) {
      _firstName = event.firstname;
      _lastName = event.lastname;
      _email = event.emill;
      _image = event.image;
      emit(ShowInformationAlert());
    });

    on<CreateUserProced>((event, emit) async {
      emit(CreateUserloaidngState());
      try {
        final imageUrl  = await _cloudinaryService.uploadImage(File(_image));
        if (imageUrl  == null) {
          emit(CrateUSerFailureState(error: "Image upload failed."));
          return;
        }
        log('response of the cloudinary: $imageUrl');
        
        final user = CreateuserEntity(firstName: firstName, lastName: lastName, email: email, avatar: imageUrl );
        
        final response = await _repository.createUser(user);

         if (response) {
          emit(CreateUSerSuccessState());
        } else {
          emit(CrateUSerFailureState(error: "Failed to create user."));
        }
      } catch (e) {
         emit(CrateUSerFailureState(error: e.toString()));
      }
    });
  }
}

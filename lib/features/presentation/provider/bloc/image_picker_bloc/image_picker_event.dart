part of 'image_picker_bloc.dart';


@immutable

abstract class ImagePickerEvent {}
class PickImageAction extends ImagePickerEvent{}
class ClearImageAction extends ImagePickerEvent {} 
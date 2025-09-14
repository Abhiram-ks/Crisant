import 'package:bloc/bloc.dart';

class LocalizationCubit extends Cubit<String> {
  LocalizationCubit() : super("en");
  void toggleText() {
    emit(state == "en" ? "hi" : "en");
  }
}

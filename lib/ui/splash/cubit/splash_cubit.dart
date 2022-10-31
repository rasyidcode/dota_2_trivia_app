import 'package:dota_2_trivia_app/data/database/trivia_database.dart';
import 'package:dota_2_trivia_app/data/network/dota_data_json.dart';
import 'package:dota_2_trivia_app/data/repository/app_repository.dart';
import 'package:dota_2_trivia_app/ui/splash/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._appRepository)
      : super(const SplashState(status: SplashStatus.initial));

  final AppRepository _appRepository;

  void checkData() async {
    emit(
      state.copyWith(
        status: SplashStatus.loading,
        stateMessage: 'Checking date...',
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    try {
      var lastDateChecked = await _appRepository.getLastChecked();

      if (DateTime.now()
          .isAfter(lastDateChecked.add(const Duration(days: 1)))) {
        emit(state.copyWith(
          stateMessage: 'Renewing data...',
        ));

        await _appRepository.fetchDotaData();

        await Future.delayed(const Duration(seconds: 1));

        await _appRepository.updateLastChecked();
      }

      emit(state.copyWith(
        status: SplashStatus.success,
        stateMessage: 'Data found...',
      ));
    } on NoResultFoundException catch (_) {
      emit(state.copyWith(
        stateMessage: 'No date found...',
      ));

      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(
        stateMessage: 'Getting online data...',
      ));

      await _appRepository.fetchDotaData();

      await _appRepository.saveLastChecked();

      emit(state.copyWith(
        status: SplashStatus.success,
        stateMessage: 'Done getting data...',
      ));
    } on Exception catch (_) {
      emit(state.copyWith(
        status: SplashStatus.failure,
        stateMessage: 'Skipping check data...',
      ));
    }
  }

  @override
  void onChange(Change<SplashState> change) {
    super.onChange(change);
  }
}

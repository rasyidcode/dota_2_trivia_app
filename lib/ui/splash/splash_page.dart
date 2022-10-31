import 'dart:async';
import 'dart:developer';

import 'package:dota_2_trivia_app/ui/home/home_page.dart';
import 'package:dota_2_trivia_app/ui/splash/cubit/splash_cubit.dart';
import 'package:dota_2_trivia_app/ui/splash/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashCubit = KiwiContainer().resolve<SplashCubit>();

  @override
  void initState() {
    super.initState();

    _splashCubit.checkData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _splashCubit,
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.status == SplashStatus.success ||
              state.status == SplashStatus.failure) {
            Timer(
                const Duration(seconds: 1),
                () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage())));
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.amber,
                  child: Text(
                    'D2T',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color.fromARGB(221, 24, 20, 20)),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const Spacer(),
                    const CircularProgressIndicator(color: Colors.white),
                    const SizedBox(height: 8.0),
                    Builder(
                      builder: (context) {
                        final stateMessage = context.select(
                            (SplashCubit cubit) => cubit.state.stateMessage);
                        return Text(
                          stateMessage ?? '',
                        );
                      },
                    ),
                    const SizedBox(height: 16.0)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:service_connect/core/services/custom_toast.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';
import 'package:service_connect/core/widgets/custom_button.dart';
import 'package:service_connect/core/widgets/custom_loading.dart';
import 'package:service_connect/features/authetication/application/authentication_bloc.dart';
import 'package:service_connect/features/authetication/presentation/widgets/logout_dilogue.dart';
import 'package:service_connect/features/location/application/location_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocationBloc>().add(const LocationEvent.getCurrentLocation());
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state.result != null) {
          state.result!.fold(
            (l) => CustomToast.errorToast(l.errorMsg),
            (r) => CustomToast.successToast('Location found'),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.appColors.primary,
          title: Text(
            'Welcome',
            style: TextStyle(
                color: context.appColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const LogoutDilogue());
              },
            ),
            const Gap(10)
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.person_pin, size: 90),
              const Gap(20),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return Text(
                    state.user?.email ?? 'No user',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
              const Gap(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text(
                    "User Location",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state.result == null) {
                    return Column(
                      children: [
                        const Gap(10),
                        CustomLoading(
                          color: context.appColors.primary,
                        ),
                        const Gap(10),
                        const Text('Fetching location...',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    );
                  }

                  return state.result!.fold(
                    (l) => Column(
                      children: [
                        const Text('Something went wrong!Location not found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        const Gap(10),
                        CustomButton(
                          color: context.appColors.grey,
                          onPressed: () {
                            context
                                .read<LocationBloc>()
                                .add(const LocationEvent.getCurrentLocation());
                          },
                          child: Text(
                            'Retry',
                            style: TextStyle(
                              color: context.appColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    (r) => state.isLoading
                        ? Column(
                            children: [
                              const Gap(10),
                              CustomLoading(
                                color: context.appColors.primary,
                              ),
                              const Gap(10),
                              const Text('Fetching location...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                'Latitude: ${r.latitude}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                'Longitude: ${r.longitude}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                'Locality: ${r.locality}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                'City: ${r.city}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                'State: ${r.state}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                'Country: ${r.country}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

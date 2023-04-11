import 'package:api_tempate_flutter/core/configs/styles/app_themes.dart';
import 'package:api_tempate_flutter/src/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../widgets/notify_indicator.dart';
import 'app_bloc/bloc/app_bloc.dart';
import 'features/admin/presentation/pages/admin_page.dart';
import 'features/sign_up/presentation/pages/signup_page.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.

          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                return BlocProvider(
                    create: (context) => AppBloc(),
                    child: BlocListener<AppBloc, AppState>(
                      listenWhen: (previous, current) =>
                          (current is! AppInitial),
                      listener: (context, state) async {
                        if (state is NotifyConfirmationState) {
                          await Notify.askConfirmationNotify(
                              context, state.function);
                        }
                        context.read<AppBloc>().add(const InitialAppEvent());
                      },
                      child: CurrentAppSwitch(
                          routeSettings.name, settingsController),
                    ));
              },
            );
          },
        );
      },
    );
  }
}

Widget CurrentAppSwitch(
    String? routeSettingsName, SettingsController settingsController) {
  switch (routeSettingsName) {
    case SettingsView.routeName:
      return SettingsView(controller: settingsController);
    case SampleItemDetailsView.routeName:
      return const SampleItemDetailsView();
    case LoginPage.routeName:
      return const LoginPage();
    case AdminPage.routeName:
      return const AdminPage();
    case SignUpPage.routeName:
      return const SignUpPage();
    case SampleItemListView.routeName:
    default:
      return const AdminPage();
  }
}

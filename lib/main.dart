import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/blocs/switch_bloc/switch_bloc.dart';
import 'package:task_app/screens/tabs_screen.dart';
import 'package:task_app/services/app_router.dart';
import 'package:task_app/services/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
// HydratedBlocOverriders.runZoned(()=>);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          theme: state.switchValue
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],
          onGenerateRoute: AppRouter.onGenerateRoute,
          home: TabScreen(),
        ),
      ),
    );
  }
}

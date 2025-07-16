import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../config/routes/nav_router.dart';
import '../config/themes/light_theme.dart';
import '../ui/widgets/unfocus.dart';
import 'bloc/bloc_di.dart';
import 'cubit/app_cubit.dart';

class OxynDev extends StatelessWidget {
  const OxynDev({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocDI(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              navigatorKey: NavRouter.navigationKey,
              title: 'Unique Employee Portal',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              themeMode: ThemeMode.light,
              builder: (BuildContext context, Widget? child) {
                child = BotToastInit()(context, child);
                child = UnFocus(child: child);
                return child;
              },
              navigatorObservers: [
                BotToastNavigatorObserver(),
              ],
              home: HomeScreen(),
              locale: state.locale,
            );
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FCM Token Example'),
      ),
      body: Center(
        child: Text('Welcom'),
      ),
    );
  }
}

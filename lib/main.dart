import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/common/extensions/num.dart';
import 'package:task/firebase_options.dart';
import 'package:task/util/di/di.dart';
import 'package:task/util/providers/all_providers.dart';
import 'package:task/util/resource/r.dart';
import 'package:task/util/router/router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //Add device pixel ratio here
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ProviderApp();
      },
    );
  }
}

class ProviderApp extends StatefulWidget {
  const ProviderApp({super.key});

  @override
  State<ProviderApp> createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setPadding(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AllProviders.providers,
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: R.colors.whiteFFFFFF,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

///[Commands]
///rm -rf ios/Pods; rm ios/Podfile.lock; rm -rf ios/.symlinks; rm pubspec.lock; rm -rf build
/// flutter clean; rm -rf ios/Pods; rm ios/Podfile.lock; rm -rf ios/.symlinks; rm pubspec.lock; rm -rf build; flutter pub get; cd ios; pod install --repo-update; cd ..

/// dart run build_runner watch --delete-conflicting-outputs

/// dart run artisan init
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// dart run artisan make:model user on auth
/// dart run artisan make:usecase login on auth --remote
/// dart run artisan make:usecase save_token on auth --local
/// dart run artisan assets
/// mkdir -p lib/features/departments/{data,domain,presentation/{providers,views,widgets}}
//  New-Item -ItemType Directory -Force -Path `
//  "lib/features/auth/data", `
//  "lib/features/auth/domain", `
//  "lib/features/auth/presentation/providers", `
//  "lib/features/auth/presentation/views", `
//  "lib/features/auth/presentation/widgets"

// powershell command
  //  New-Item -ItemType Directory -Force -Path `
  //  "lib/features/auth/data", `
  //  "lib/features/auth/domain", `
  //  "lib/features/auth/presentation/providers", `
  //  "lib/features/auth/presentation/views", `
  //  "lib/features/auth/presentation/widgets"

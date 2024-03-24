import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mylib/mylib.dart';

import 'common/state_logger.dart';
import 'firebase_options.dart';
import 'presentation/navigation/router.dart';
import 'presentation/pages/component.dart';
import 'presentation/viewmodel/auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  runApp(
    const ProviderScope(
      observers: [
        StateLogger(),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      scaffoldMessengerKey: scaffoldSnackbarKey,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

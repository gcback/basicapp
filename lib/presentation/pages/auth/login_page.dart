import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mylib/mylib.dart';

import 'auth_field_types.dart';
import 'auth_utils.dart';
import 'login_email_view.dart';
import 'login_sns_view.dart';

final loginFormKey = GlobalKey<FormState>();

class LogInPage extends HookConsumerWidget {
  const LogInPage({super.key});

  static const location = '/auth';

  static const title = 'LogIn Page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllers = useFormFieldControllers(fields: EditFormField.login);

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        actions: [
          IconButton(
            onPressed: () async => context.goNamed('signup'),
            icon: const Icon(Icons.person_add_alt),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: 12.0.horiInsets,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 1,
                child: Form(
                  key: loginFormKey,
                  child: LoginWithEmailView(
                    controllers: controllers,
                    title: 'LogInView',
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: LoginWithGoogle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

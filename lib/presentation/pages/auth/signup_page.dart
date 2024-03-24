import 'package:basicapp/presentation/pages/component/action_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mylib/mylib.dart';

import '../../viewmodel/auth/auth.dart';
import '../../viewmodel/auth/auth_controller.dart';
import 'auth_field_types.dart';
import 'auth_utils.dart';
import 'signup_view.dart';

final signUpFormKey = GlobalKey<FormState>();

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  static const location = '/auth/signup';

  static const title = 'SignUp Page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllers = useFormFieldControllers(fields: EditFormField.signup);
    final asyncUser = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(
        child: Padding(
          padding: 12.0.horiInsets,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: Form(
                  key: signUpFormKey,
                  child: SignUpView(controllers: controllers, title: 'SignUpView'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: asyncUser.whenOrNull(
                    data: (user) {
                      return switch (user) {
                        SignedIn data => Container(
                            height: 150.0,
                            alignment: Alignment.center,
                            child: Text(data.email),
                          ),
                        _ => const Text('Empty', style: TextStyle(color: Colors.red)),
                      };
                    },
                  )!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

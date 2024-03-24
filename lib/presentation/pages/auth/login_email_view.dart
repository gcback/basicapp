import 'package:basicapp/presentation/pages/auth/login_page.dart';
import 'package:basicapp/presentation/pages/component/action_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mylib/mylib.dart';

import '../../viewmodel/auth/auth_controller.dart';
import '../component/auth_formfield.dart';
import 'auth_field_types.dart';
import 'auth_utils.dart';

class LoginWithEmailView extends HookConsumerWidget {
  const LoginWithEmailView({
    super.key,
    required this.controllers,
    required this.title,
  });

  final String title;
  final Map<EditFormField, TextEditingController> controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailEditNode = useFocusNode();

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthFormField(
            controller: controllers[EditFormField.email]!,
            focusNode: emailEditNode,
            label: '이메일',
            hint: 'abc@example.com',
            validator: (value) {
              if (value!.isEmpty) return null;
              if (value case var value when isEmailValid(value)) return null;

              return 'Invalid email';
            },
            onChanged: (value) {},
          ),
          const Gap(16.0),
          AuthFormField(
            controller: controllers[EditFormField.password]!,
            label: '비밀번호',
            hint: '영대소문자, 6~12자리',
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) return null;
              if (value case var value when isPasswordValid(value)) {
                return null;
              }

              return 'Invalid password';
            },
            onChanged: (value) {},
          ),
          ActionButton(
            onPressed: () async {
              if (!loginFormKey.currentState!.validate()) return;

              final success = await ref.read(authControllerProvider.notifier).login(
                    controllers.authValue.email,
                    controllers.authValue.password,
                  );

              if (!success) {
                controllers.forEach((field, controller) {
                  controller.text = '';
                });
              }

              emailEditNode.requestFocus();
            },
            label: const Text('Login'),
            icon: const Icon(Icons.login_outlined),
          ),
        ],
      ),
    );
  }
}

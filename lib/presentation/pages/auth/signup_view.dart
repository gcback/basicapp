import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mylib/mylib.dart';
import '../../viewmodel/auth/auth_controller.dart';
import '../component/action_button.dart';
import '../component/auth_formfield.dart';
import 'auth_field_types.dart';
import 'auth_utils.dart';
import 'signup_page.dart';

class SignUpView extends HookConsumerWidget {
  const SignUpView({super.key, required this.controllers, required this.title});

  final String title;
  final Map<EditFormField, TextEditingController> controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailEditNode = useFocusNode();

    final tempPassword = useRef('');

    return Column(
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
              tempPassword.value = value;
              return null;
            }

            return 'Invalid password';
          },
          onChanged: (value) {},
        ),
        const Gap(16.0),
        AuthFormField(
          controller: controllers[EditFormField.confirm]!,
          label: '비밀번호 확인',
          hint: '영대소문자, 6~12자리',
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) return null;
            if (value case var value when value == tempPassword.value && isPasswordValid(value)) {
              return null;
            }

            return 'not matched';
          },
          onChanged: (value) {},
        ),
        ActionButton(
          onPressed: () async {
            if (!signUpFormKey.currentState!.validate()) return;

            final success = await ref.read(authControllerProvider.notifier).signup(
                  controllers.authValue.email,
                  controllers.authValue.password,
                );
                
            if (success && context.mounted) {
              return context.goNamed('login');
            }

            controllers.forEach((field, controller) {
              controller.text = '';
            });

            emailEditNode.requestFocus();
          },
          label: const Text('Register'),
          icon: const Icon(Icons.person_add_alt_1_outlined),
        )
      ],
    );
  }
}

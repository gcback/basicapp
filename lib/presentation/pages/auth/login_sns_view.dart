import 'package:basicapp/presentation/viewmodel/auth/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mylib/mylib.dart';

class LoginWithGoogle extends HookConsumerWidget {
  const LoginWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: InkWell(
        onTap: () {
          ref.read(authControllerProvider.notifier).loginWithGoogle();
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://pngimg.com/uploads/google/google_PNG19635.png'),
              const Gap(4.0),
              const Text('Continue with Google',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

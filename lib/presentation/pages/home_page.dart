part of '../page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const location = '/';
  static const title = 'Home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(authControllerProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(title),
        actions: [
          ActionButton(
            onPressed: () {
              return ref.read(authControllerProvider.notifier).logout();
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: 12.0.horiInsets,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              asyncUser.whenOrNull(
                data: (user) {
                  return switch (user) {
                    SignedIn data => Container(
                        height: 150.0,
                        alignment: Alignment.center,
                        child: Text(data.email),
                      ),
                    _ => const Text('Invalid login', style: TextStyle(color: Colors.red)),
                  };
                },
              )!,
            ],
          ),
        ),
      ),
    );
  }
}

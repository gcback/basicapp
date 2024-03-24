import 'package:mylib/mylib.dart';

enum EditFormField {
  email,
  password,
  confirm;

  static get signup => const <EditFormField>[email, password, confirm];
  static get login => const <EditFormField>[email, password];
}

typedef ControllerMap = Map<EditFormField, TextEditingController>;
typedef AuthInput = ({String email, String password});

extension ControllerMapExts on ControllerMap {
  AuthInput get authValue => (
        email: this[EditFormField.email]!.text,
        password: this[EditFormField.password]!.text,
      );

  get empty => const (email: '', password: '');
}

enum BrandLogoEnum {
  google(path: 'http://spsms.dyndns.org:3100/images/logo/google.jpg'),
  apple(path: 'http://spsms.dyndns.org:3100/images/logo/apple.jpg'),
  kakao(path: 'http://spsms.dyndns.org:3100/images/logo/apple.jpg');

  final String path;

  const BrandLogoEnum({required this.path});
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/exceptions.dart';
import '../data/repository_impl.dart';
import 'profile.dart';
import 'repository_iface.dart';
import 'usecase_iface.dart';

part 'usecase_impl.g.dart';

///
////// 비즈니스 로직 구현에 필요한 repository instance를 만든다.
///   repository interface의 specification은 domain layer에서 정의하기 때문에
///   domain layer는 data layer에 대해 독립적이다.
///
@riverpod
class UseCaseImpl extends _$UseCaseImpl implements UseCase1 {
  late RepositoryIface? _repository;
  RepositoryIface get repository =>
      _repository ?? (throw DomainLayerException('repository not ready'));

  @override
  UseCaseImpl build() {
    _repository = ref.watch(repositoryImplProvider.notifier);

    return UseCaseImpl();
  }

  @override
  Future<void> add(Profile profile) {
    return _repository!.add(profile);
  }

  @override
  Future<ProfileList> get(int id, int count) {
    return _repository!.get(id, count);
  }

  @override
  Future<ProfileList> next() {
    return _repository!.next();
  }

  @override
  Future<void> remove(int id) {
    return _repository!.remove(id);
  }
}

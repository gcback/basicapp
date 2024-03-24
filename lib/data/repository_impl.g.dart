// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoryImplHash() => r'561446994e73b1a10c2824eee2cb9b5fa53e16af';

/// RepositoryImpl는 DataSource에 대한 인스턴스를 런타임에 결정할 수 있기 때문에 외부에
///   추상성을 제공한다. 그리고 실제 data 처리를 수행하는 data source에대한 gateway 역할이다.
///
///
/// Copied from [RepositoryImpl].
@ProviderFor(RepositoryImpl)
final repositoryImplProvider =
    AutoDisposeNotifierProvider<RepositoryImpl, RepositoryImpl>.internal(
  RepositoryImpl.new,
  name: r'repositoryImplProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoryImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RepositoryImpl = AutoDisposeNotifier<RepositoryImpl>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

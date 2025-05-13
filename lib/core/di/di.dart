import 'package:goallook/core/di/di.config.dart';
import 'package:goallook/core/get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
Future<void> setupDependencies() async => getIt.init();
import 'package:fpdart/fpdart.dart';
import 'package:clean_architecture/core/errors/failures.dart';

typedef ResultEither<T> = Future<Either<Failure, T>>;
typedef ResultOption = Future<Option<Failure>>;
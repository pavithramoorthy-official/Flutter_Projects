import 'package:clean_architecture/feature/quotes/domain/entity/quotes_entity.dart';
import 'package:clean_architecture/feature/quotes/domain/locator/quotes_locator.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'quotes_notifier.g.dart';

@riverpod
class GetQuotesNotifier extends _$GetQuotesNotifier{
  @override
  Future<QuotesEntity> build()async{
    fetch();
    return future;
  }
  fetch()async{
    state = AsyncLoading();
    final getQuotes = await ref.read(quotesRepositoryLocatorProvider).getQuotesList();
    state = getQuotes.fold(
            (failure) {
          // Handle failure case
          return AsyncError(failure.message, StackTrace.current);
        },
    (quotesEntity) {
      // Handle success case
      return AsyncData(quotesEntity);
    },
    );
  }
}
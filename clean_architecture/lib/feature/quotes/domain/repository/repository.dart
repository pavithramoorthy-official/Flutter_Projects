import 'package:clean_architecture/feature/quotes/domain/entity/quotes_entity.dart';

import '../../../../core/utils/typedefs.dart';

abstract class QuotesRepository{
  ResultEither<QuotesEntity> getQuotesList();
}
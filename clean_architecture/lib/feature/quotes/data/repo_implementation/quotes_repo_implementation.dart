import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/feature/quotes/data/datasource/datasource.dart';
import 'package:clean_architecture/feature/quotes/domain/repository/repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/typedefs.dart';
import '../../domain/entity/quotes_entity.dart';

class QuotesRepositoryImplementation extends QuotesRepository{
  final QuotesDataSource qDataSource;

  QuotesRepositoryImplementation(this.qDataSource);

  @override
  ResultEither<QuotesEntity> getQuotesList() async{
    try{
      final quotesModel = await qDataSource.getQuotes();
      final quotesEntity = quotesModel.toDomain();
      return Right(quotesEntity);
    }catch (e){
      return Left(ServiceFailure(e.toString()));
    }
  }
}
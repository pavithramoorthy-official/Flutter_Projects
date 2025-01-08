  import 'package:clean_architecture/feature/quotes/data/datasource/datasource.dart';
  import 'package:clean_architecture/feature/quotes/data/repo_implementation/quotes_repo_implementation.dart';
  import 'package:clean_architecture/feature/quotes/domain/repository/repository.dart';
  import 'package:dio/dio.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:riverpod_annotation/riverpod_annotation.dart';
  part 'quotes_locator.g.dart';


  @riverpod
  QuotesDataSource quotesDataSourceLocator(Ref ref){
    final dio = Dio();
    return QuotesDataSourceImplementation(dio);
  }

  @riverpod
  QuotesRepository quotesRepositoryLocator(Ref ref){
    final quotesDataSource = ref.watch(quotesDataSourceLocatorProvider);
    return QuotesRepositoryImplementation(quotesDataSource);
  }
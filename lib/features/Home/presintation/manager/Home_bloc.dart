import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:versomarket/dataProviders/error/failures.dart';
import 'package:versomarket/features/Home/data/model/CategoriesModel.dart';
import 'package:versomarket/features/Product/data/model/ProductModel.dart';
import 'package:versomarket/features/ProductDeatils/data/model/ProductDeatilsModel.dart';
import 'package:versomarket/features/ProductDeatils/data/repository/ProductDeatilsRepository.dart';
import 'package:versomarket/features/ProductDeatils/presintation/manager/ProductDeatils_bloc.dart';
import 'package:versomarket/features/Home/data/model/CarouselModel.dart';

import '../../data/repository/HomeRepository.dart';

part 'Home_event.dart';
part 'Home_state.dart';

class Home_bloc
    extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  Home_bloc({required this.repository})
      : super(carouselInitial());
  @override
  Stream<HomeState> mapEventToState(
      HomeEvent event) async* {
    if (event is carouselEvent) {
      yield carouselLoading();
      final failureOrData = await repository.carousel();

      yield* failureOrData.fold(
        (failure) async* {
          log('yield is error');
          yield carouselError(errorMessage: mapFailureToMessage(failure));
        },
        (data) async* {
          log('yield is loaded');
          yield carouselLoaded(
            carouselModel: data,
          );
        },
      );
    }

    if (event is categoriesEvent) {
      yield categoriesLoading();
      final failureOrData = await repository.categories();
      yield* failureOrData.fold(
            (failure) async* {
          log('yield is error');
          yield categoriesError(errorMessage: mapFailureToMessage(failure));
        },
            (data) async* {
          log('yield is loaded');
          yield categoriesLoaded(
            categoriesModel: data,
          );
        },
      );
    }

    if (event is featuredProductsEvent) {
      yield featuredProductsLoading();
      final failureOrData = await repository.featuredProducts();
      yield* failureOrData.fold(
            (failure) async* {
          log('yield is error');
          yield featuredProductsError(errorMessage: mapFailureToMessage(failure));
        },
            (data) async* {
          log('yield is loaded');
          yield featuredProductsLoaded(
            productModel: data,
          );
        },
      );
    }
  }
}

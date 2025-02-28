import 'package:dartz/dartz.dart';
import 'package:versomarket/dataProviders/error/failures.dart';
import 'package:versomarket/dataProviders/local_data_provider.dart';
import 'package:versomarket/dataProviders/network/Network_info.dart';
import 'package:versomarket/dataProviders/network/data_source_url.dart';
import 'package:versomarket/dataProviders/remote_data_provider.dart';
import 'package:versomarket/dataProviders/repository.dart';
import 'package:versomarket/features/Product/data/model/ProductModel.dart';
import '../model/CarouselModel.dart';
import '../model/CategoriesModel.dart';

class HomeRepository extends Repository {
  final RemoteDataProvider remoteDataProvider;
  final NetworkInfo networkInfo;
  final LocalDataProvider localDataProvider;
  HomeRepository(
      {required this.remoteDataProvider,
        required this.networkInfo,
        required this.localDataProvider});

  Future<Either<Failure, dynamic>> carousel() async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          List<CarouselModel> remoteData = await remoteDataProvider.getData(
            url: DataSourceURL.carousel,
            returnType: List,
            retrievedDataType: CarouselModel.init(),
          );
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }


  Future<Either<Failure, dynamic>> categories() async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          List<CategoriesModel> remoteData = await remoteDataProvider.getData(
            url: DataSourceURL.categories,
            returnType:List,
            retrievedDataType: CategoriesModel.init(),
          );
          print(remoteData);
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }


  Future<Either<Failure, dynamic>> featuredProducts() async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          List<ProductModel> remoteData = await remoteDataProvider.getData(
            url: DataSourceURL.featuredProducts,
            returnType:List,
            retrievedDataType: ProductModel.init(),
          );
          print(remoteData);
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }
}

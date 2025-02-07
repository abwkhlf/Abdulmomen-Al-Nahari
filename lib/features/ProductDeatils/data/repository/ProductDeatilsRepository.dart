import 'package:dartz/dartz.dart';
import 'package:versomarket/dataProviders/error/failures.dart';
import 'package:versomarket/dataProviders/local_data_provider.dart';
import 'package:versomarket/dataProviders/network/Network_info.dart';
import 'package:versomarket/dataProviders/network/data_source_url.dart';
import 'package:versomarket/dataProviders/remote_data_provider.dart';
import 'package:versomarket/dataProviders/repository.dart';
import 'package:versomarket/features/ProductDeatils/data/model/ProductDeatilsModel.dart';

class ProductDeatilsRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final NetworkInfo networkInfo; //check if the device is connected to internet
  final LocalDataProvider localDataProvider;
  ProductDeatilsRepository(
      {required this.remoteDataProvider,
      required this.networkInfo,
      required this.localDataProvider});

  Future<Either<Failure, dynamic>> getAllProductDeatils(String id) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          ProductDeatilsModel remoteData = await remoteDataProvider.getData(
            url: DataSourceURL.getAllproducts + "/" + id,
            returnType: ProductDeatilsModel.init(),
            retrievedDataType: ProductDeatilsModel.init(),
          );
          print(remoteData);
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }
}

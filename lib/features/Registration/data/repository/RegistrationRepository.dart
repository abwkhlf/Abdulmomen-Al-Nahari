import 'package:dartz/dartz.dart';
import 'package:versomarket/dataProviders/error/failures.dart';
import 'package:versomarket/dataProviders/local_data_provider.dart';
import 'package:versomarket/dataProviders/network/Network_info.dart';
import 'package:versomarket/dataProviders/network/data_source_url.dart';
import 'package:versomarket/dataProviders/remote_data_provider.dart';
import 'package:versomarket/dataProviders/repository.dart';
import 'package:versomarket/features/Registration/data/model/RegistrationModel.dart';

class RegistrationRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final NetworkInfo networkInfo; //check if the device is connected to internet
  final LocalDataProvider localDataProvider;
  RegistrationRepository(
      {required this.remoteDataProvider,
        required this.networkInfo,
        required this.localDataProvider});

  Future<Either<Failure, dynamic>> sinUp(String username, String email, String password) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          RegistrationModel remoteData = await remoteDataProvider.sendJsonData(
            url: DataSourceURL.signup,
            returnType: RegistrationModel.init(),
            retrievedDataType: RegistrationModel.init(),
            jsonData: {
              "username": username,
              "email": email,
              "password": password
            },
          );
          print(remoteData);
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }


  Future<Either<Failure, dynamic>> login(String username, String password) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          RegistrationModel remoteData = await remoteDataProvider.sendJsonData(
            url: DataSourceURL.login,
            returnType: RegistrationModel.init(),
            retrievedDataType: RegistrationModel.init(),
            jsonData: {
              "username": username,
              "password": password
            },
          );
          print(remoteData);
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }


}

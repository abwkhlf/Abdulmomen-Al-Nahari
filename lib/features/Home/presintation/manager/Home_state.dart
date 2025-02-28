part of 'Home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class carouselInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class carouselLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class carouselLoaded extends HomeState {
  List<CarouselModel> carouselModel;
  carouselLoaded({required this.carouselModel});

  @override
  List<Object> get props => [carouselModel];
}

class carouselError extends HomeState {
  String errorMessage;

  carouselError({required this.errorMessage});

  @override
  List<Object> get props => [];
}


//categories
class categoriesInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class categoriesLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class categoriesLoaded extends HomeState {
  List<CategoriesModel> categoriesModel;
  categoriesLoaded({required this.categoriesModel});

  @override
  List<Object> get props => [categoriesModel];
}

class categoriesError extends HomeState {
  String errorMessage;

  categoriesError({required this.errorMessage});

  @override
  List<Object> get props => [];
}

class featuredProductsLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class featuredProductsLoaded extends HomeState {
  List<ProductModel> productModel;
  featuredProductsLoaded({required this.productModel});

  @override
  List<Object> get props => [productModel];
}

class featuredProductsError extends HomeState {
  String errorMessage;

  featuredProductsError({required this.errorMessage});

  @override
  List<Object> get props => [];
}
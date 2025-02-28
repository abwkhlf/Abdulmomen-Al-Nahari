part of 'Home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class carouselEvent extends HomeEvent {

  @override
  List<Object> get props => [];
  const carouselEvent();
}

class categoriesEvent extends HomeEvent {
  @override
  List<Object> get props => [];
  const categoriesEvent();
}

class featuredProductsEvent extends HomeEvent {
  @override
  List<Object> get props => [];
  const featuredProductsEvent();
}

class GetLast10Product extends HomeEvent {
  @override
  List<Object> get props => [];
}

import 'package:dart_mediatr/dart_mediatr.dart';
import 'package:bloc/bloc.dart';
import 'package:msdt/usecases/getCategoriesQueryResponse.dart';
import 'package:msdt/usecases/get_categories_query.dart';
import 'package:msdt/usecases/models/category.dart';

// Bloc Event
abstract class CategoriesEvent {}

class LoadCategories extends CategoriesEvent {}

// Bloc State
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String error;
  CategoriesError(this.error);
}

// Bloc Implementation
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    final Mediator mediator = Mediator();

    on<LoadCategories>((event, emit) async {
      emit(CategoriesLoading());
      try {
        final categories = await mediator.send<GetCategoriesQuery,
            Future<GetCategoriesQueryResponse>>(GetCategoriesQuery());
        emit(CategoriesLoaded(categories.categories));
      } catch (e) {
        print(e);
        emit(CategoriesError(e.toString()));
      }
    });
  }
}

// GetIt Registration

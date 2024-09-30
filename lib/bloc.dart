import 'package:dart_mediatr/dart_mediatr.dart';
import 'package:msdt/models/getCategoriesQueryResponse.dart';
import 'get_categories_handler.dart';
import 'get_categories_query.dart';
import 'package:bloc/bloc.dart';
import 'models/category.dart';
import 'package:get_it/get_it.dart';

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
  final Mediator mediator;

  CategoriesBloc(this.mediator) : super(CategoriesInitial()) {
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
void setupLocator() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<Mediator>(
      Mediator()..registerQueryHandler(GetCategoriesHandler()));
}

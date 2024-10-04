// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MediatorGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:dart_mediatr/dart_mediatr.dart';
import 'package:msdt/usecases/get_categories_handler.dart';

Mediator mediator = Mediator();

void registerCommandHandlers() {}

void registerQueryHandlers() {
  mediator.registerQueryHandler(GetCategoriesHandler());
}

void registerRequestHandlers() {}

void registerAllHandlers() {
  registerCommandHandlers();
  registerQueryHandlers();
  registerRequestHandlers();
}

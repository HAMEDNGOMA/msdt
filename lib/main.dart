import 'package:dart_mediatr/dart_mediatr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msdt/bloc.dart';

@MediatorInit()
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc()..add(LoadCategories()),
      child: const MaterialApp(
        home: CategoriesScreen(),
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesLoaded) {
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.categories[index].name),
                );
              },
            );
          } else if (state is CategoriesError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Press to load categories'));
        },
      ),
    );
  }
}

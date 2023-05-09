## Getting started

- ScopedBuilder: Listen Cubit events and reactively rebuilds your widget

  ```dart
  final cubit = injector.get<MyCubit>();

  ScopedBuilder<List<TodoModel>>(
    cubit: cubit,
    onError: (context, state) {
      return Center(
        child: Text(state.message),
      );
    },
    onLoading: (context) {
      return const Center(child: CircularProgressIndicator.adaptive());
    },
    onSuccess: (context, state) {
      return Center(child: Text(state.toString()));
    },
  );
  ```

- Store: A basic store that emits states

  ```dart
  class MyCubit extends Store<List<int>> {
      final MyUseCase _useCase;

      MyCubit(this._useCase);

      void fetchInts() => execute(() => _useCase.getInts());
  }
  ```

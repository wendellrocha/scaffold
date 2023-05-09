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

- AbstractState: An abstract state with basic states

  - AbstractInitialState
  - AbstractLoadingState
  - AbstractLoadedState

    ```dart
    AbstractLoadedState<T> extends AbstractState {
        final T content;

        AbstractLoadedState(this.context);

        @override
        List<Object?> get props => [content];
    }
    ```

  - AbstractErrorState

    ```dart
    AbstractErrorState extends AbstractState {
        final String message;

        AbstractErrorState(this.message);

        @override
        List<Object?> get props => [message];
    }
    ```

- Store: A basic store that emits states

  ```dart
  class MyCubit extends Store<List<int>> {
      final MyUseCase _useCase;

      MyCubit(this._useCase);

      void fetchInts() => execute(() => _useCase.getInts());
  }
  ```

- ScaffoldState: A state that init your container and controller and clear on dispose

  ```dart
  class _TodosPageState extends InjectionState<TodosPage, TodosController> {
    @override
    ScaffoldContainer get container => TodosContainer();

    @override
    void initState() {
        super.initState();
        controller.fetchTodos();
    }
  }
  ```

- InjectionContainer: A container to inject dependencies

  ```dart
  class TodosContainer extends InjectionContainer {
      TodosContainer() : super(scope: 'todos');

      @override
      List<Injection> get binds => [
              (i) => i.registerLazySingleton<TodoDatasource>(
                  () => TodoDatasourceImpl(
                      i.get(),
                  ),
                  ),
              (i) => i.registerLazySingleton<TodoRepository>(
                  () => TodoRepositoryImpl(
                      i.get(),
                  ),
                  ),
              (i) => i.registerLazySingleton<TodoUseCase>(
                  () => TodoUseCaseImpl(
                      i.get(),
                  ),
                  ),
              (i) => i.registerLazySingleton<TodosCubit>(
                  () => TodosCubit(
                      i.get(),
                  ),
                  ),
              (i) => i.registerLazySingleton<TodosController>(
                  () => TodosController(i.get())),
          ];
  }
  ```

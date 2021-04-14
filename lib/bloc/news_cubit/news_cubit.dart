import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/news_repository.dart';
import 'package:stock_companion/models/news.dart';

class NewsBloc extends Bloc<CommonEvent, CommonState> {
  NewsBloc({INewsRepoesitory repository})
      : _repo = repository,
        super(FetchingItemsState());
  final INewsRepoesitory _repo;

  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    if (event is FetchItems) {
      try {
        var share = await _repo.getNews('sharesansar');
        var mer0 = await _repo.getNews('merolagani');
        var nepail = await _repo.getNews('nepalipaisa');

        yield FetchedItemsState(items: [share, mer0, nepail]);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}

class INewsRepository {}

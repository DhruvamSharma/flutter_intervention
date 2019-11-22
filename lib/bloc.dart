import 'package:rxdart/rxdart.dart';

class _Bloc {

  Stream<int> get bottomNavigationIndexStream => _bottomNavigationIndexStreamController.stream;
  final _bottomNavigationIndexStreamController = BehaviorSubject<int>();

  void updateIndex(int newIndex) {
    print(newIndex);
    _bottomNavigationIndexStreamController.sink.add(newIndex);
  }

  void destroy(){
    _bottomNavigationIndexStreamController.close();
  }
}

final bloc = _Bloc();
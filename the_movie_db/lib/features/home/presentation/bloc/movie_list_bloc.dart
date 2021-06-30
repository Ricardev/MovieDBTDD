import 'package:mobx/mobx.dart';
import 'package:mobx_codegen/mobx_codegen.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

import 'base_model.dart';
import 'state_info_model.dart';

/// States list response model class
abstract class StatesListModel extends BaseModel {
  /// Class constructor
  StatesListModel({
    this.states,
  });

  /// List of states.
  final List<StatesInfoModel> states;
}

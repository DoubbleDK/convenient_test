import 'package:test_api/src/backend/state.dart'; // ignore: implementation_imports
import 'package:efficient_test_common/efficient_test_common.dart';

extension ExtTestEntryState on TestEntryState {
  State toState() => State(Status.parse(status), Result.parse(result));

  SimplifiedStateEnum toSimplifiedStateEnum() => toState().toSimplifiedStateEnum();
}

extension ExtState on State {
  SimplifiedStateEnum toSimplifiedStateEnum() {
    switch (status) {
      case Status.pending:
        return SimplifiedStateEnum.pending;
      case Status.running:
        return SimplifiedStateEnum.running;
      case Status.complete:
        switch (result) {
          case Result.success:
            return SimplifiedStateEnum.completeSuccess;
          case Result.skipped:
            return SimplifiedStateEnum.completeSkipped;
          case Result.failure:
          case Result.error:
            return SimplifiedStateEnum.completeFailureOrError;
          default:
            throw Exception;
        }
      default:
        throw Exception;
    }
  }
}

// avoid name conflict
typedef TestApiState = State;

// simplified: It is possible to have combination like `running + failed`, but we all think it as `running`
enum SimplifiedStateEnum {
  pending,
  // can be running+success/skipped/failure/error, but we group into one
  running,
  completeSuccess,
  completeSkipped,
  completeFailureOrError,
}

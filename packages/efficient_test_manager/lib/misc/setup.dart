import 'package:get_it/get_it.dart';
import 'package:efficient_test_manager/services/misc_service.dart';
import 'package:efficient_test_manager/services/efficient_test_manager_service.dart';
import 'package:efficient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:efficient_test_manager/stores/log_store.dart';
import 'package:efficient_test_manager/stores/organization_store.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LogStore>(LogStore());
  getIt.registerSingleton<OrganizationStore>(OrganizationStore());
  getIt.registerSingleton<TestToolManagerService>(TestToolManagerService());
  getIt.registerSingleton<VmServiceWrapperService>(VmServiceWrapperService());
  getIt.registerSingleton<MiscService>(MiscService());

  GetIt.I.get<TestToolManagerService>().serve();
}

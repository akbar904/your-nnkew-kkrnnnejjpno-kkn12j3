
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<String> _financialData = [];

	List<String> get financialData => _financialData;

	Future<void> fetchFinancialData() async {
		// Simulate fetching financial data
		await Future.delayed(Duration(seconds: 2));
		_financialData = ['Stock A: \$100', 'Stock B: \$200', 'Stock C: \$300'];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Financial Data',
			description: 'Here is some financial data',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'Financial Notice',
			description: 'Financial data has been updated',
		);
	}
}

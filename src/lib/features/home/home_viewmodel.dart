
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MockUser {
	final String name;
	final int age;
	final String email;

	MockUser({required this.name, required this.age, required this.email});
}

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	MockUser? _user;
	MockUser? get user => _user;

	void fetchUserData() {
		_user = MockUser(name: 'John Doe', age: 30, email: 'johndoe@example.com');
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'User Info',
			description: 'Name: ${_user?.name}, Age: ${_user?.age}, Email: ${_user?.email}',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'User Details',
			description: 'Name: ${_user?.name}, Age: ${_user?.age}, Email: ${_user?.email}',
		);
	}
}

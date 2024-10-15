
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
	const HomeView({super.key});

	@override
	Widget builder(
		BuildContext context,
		HomeViewModel viewModel,
		Widget? child,
	) {
		return Scaffold(
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.symmetric(horizontal: 25),
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								const SizedBox(height: 50),
								Column(
									children: [
										const Text(
											'Financial Data Dashboard',
											style: TextStyle(
												fontSize: 35,
												fontWeight: FontWeight.w900,
											),
										),
										const SizedBox(height: 25),
										viewModel.isBusy
											? const CircularProgressIndicator()
											: viewModel.financialData != null
												? FinancialDataWidget(data: viewModel.financialData!)
												: const Text('No data available'),
									],
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: [
										MaterialButton(
											color: Colors.grey,
											onPressed: viewModel.showDialog,
											child: const Text(
												'Show Dialog',
												style: TextStyle(
													color: Colors.white,
												),
											),
										),
										MaterialButton(
											color: Colors.grey,
											onPressed: viewModel.showBottomSheet,
											child: const Text(
												'Show Bottom Sheet',
												style: TextStyle(
													color: Colors.white,
												),
											),
										),
									],
								),
							],
						),
					),
				),
			),
		);
	}

	@override
	HomeViewModel viewModelBuilder(
		BuildContext context,
	) => HomeViewModel();
}

class FinancialDataWidget extends StatelessWidget {
	final FinancialData data;

	const FinancialDataWidget({required this.data, Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Column(
			children: [
				Text('Stock: ${data.stock}'),
				Text('Price: ${data.price}'),
				Text('Change: ${data.change}'),
			],
		);
	}
}

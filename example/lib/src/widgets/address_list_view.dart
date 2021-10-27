import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

import 'address_tile.dart';

class AddressListView extends StatelessWidget {
  final List<Address> result;
  final bool loading;
  final String? error;

  const AddressListView({
    Key? key,
    required this.loading,
    required this.result,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error != null) {
      return Center(
        child: Text('Error: $error'),
      );
    }

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (c, i) => AddressTile(result[i]),
    );
  }
}

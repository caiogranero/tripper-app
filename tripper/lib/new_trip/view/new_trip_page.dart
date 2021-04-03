import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripper/new_trip/cubit/new_trip_cubit.dart';

import 'new_trip_form.dart';

class NewTripPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => NewTripPage());
  }

  const NewTripPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: MediaQuery.of(context).size.height / 4,
        // backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Information Trip"),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (_) => NewTripCubit(),
        child: NewTripForm(),
      ),
    );
  }
}

// class _NewTripTitle extends StatelessWidget implements PreferredSizeWidget {
//   const _NewTripTitle({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           "I want to go to...",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.normal,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

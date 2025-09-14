import 'package:crisent_pannel/core/common/custom_appbar.dart';
import 'package:crisent_pannel/core/common/custom_connectivity_state.dart';
import 'package:crisent_pannel/core/constant/constant.dart';
import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/connectiviy_bloc/connectivity_bloc.dart';
import 'package:crisent_pannel/features/presentation/provider/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AdduserScreen extends StatelessWidget {
  final bool isView;
  const AdduserScreen({super.key, required this.isView});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkBloc(NetWorkChecker())),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Scaffold(
            appBar: CustomAppBar(),
            body: SafeArea(
              child: AddUserBodyWidget(
                screenWidgth: screenWidth,
                screenHight: screenHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddUserBodyWidget extends StatefulWidget {
  final double screenWidgth;
  final double screenHight;
  const AddUserBodyWidget({
    super.key,
    required this.screenWidgth,
    required this.screenHight,
  });

  @override
  State<AddUserBodyWidget> createState() => _AddUserBodyWidgetState();
}

class _AddUserBodyWidgetState extends State<AddUserBodyWidget> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkBloc>().add(CheckConnectivity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, status) {
        handleNetworkState(context, status, true);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.screenWidgth * 0.06,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create An account",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ConstantWidgets.hight10(context),
                    Text(
                      "Please enter your details to complete your account creation process.",
                    ),
                    ConstantWidgets.hight50(context),
                    BlocBuilder<ImagePickerBloc, ImagePickerState>(
                      builder: builder)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:rtu_mirea_app/app/app.dart';
import 'package:rtu_mirea_app/service_locator.dart';

class FirebaseInteractedMessageListener extends StatelessWidget {
  const FirebaseInteractedMessageListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        Logger().i('FirebaseInteractedMessageListener: $state');
        if (state is InteractedMessageRecieved) {
          if (state.discoursePostIdToOpen != null) {
            final postId = state.discoursePostIdToOpen;
            final router = getIt<GoRouter>();
            router.go('/services/discourse-post-overview/$postId');
          }
        }
      },
      child: child,
    );
  }
}

import 'package:docdoc2/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_observer.dart';
import 'core/di/dependency_injection.dart';
import 'doc_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(
    DocDocApp(
      appRouter: AppRouter(),
    ),
  );
}

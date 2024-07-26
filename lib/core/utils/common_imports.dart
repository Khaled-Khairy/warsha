// External packages
export 'package:device_preview/device_preview.dart';
export 'package:dio/dio.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:get_it/get_it.dart';
export 'package:go_router/go_router.dart';
export 'package:icons_plus/icons_plus.dart';
export 'package:lottie/lottie.dart';

// Errors and failures
export 'package:warsha2/core/errors/failure.dart';

// Core functions
export 'package:warsha2/core/functions/close_keyboard.dart';
export 'package:warsha2/core/functions/show_custom_snack_bar.dart';

// Core utilities and services
export 'package:warsha2/core/utils/api_service.dart';
export 'package:warsha2/core/utils/app_router.dart';
export 'package:warsha2/core/utils/colors.dart';
export 'package:warsha2/core/utils/service_locator.dart';
export 'package:warsha2/core/utils/styles.dart';
export 'package:warsha2/core/utils/theme.dart';

// Core widgets
export 'package:warsha2/core/widgets/custom_loading.dart';

// Feature-specific views and data models
// Auth feature
export 'package:warsha2/features/auth/data/models/login_data/login_response.dart';
export 'package:warsha2/features/auth/data/models/login_data/login_user.dart';
export 'package:warsha2/features/auth/data/models/register_data/register_user.dart';
export 'package:warsha2/features/auth/data/repos/auth_repo.dart';
export 'package:warsha2/features/auth/data/repos/auth_repo_impl.dart';
export 'package:warsha2/features/auth/presentation/manager/login_cubit/login_cubit.dart';
export 'package:warsha2/features/auth/presentation/manager/register_cubit/register_cubit.dart';
export 'package:warsha2/features/auth/presentation/views/login/login_view.dart';
export 'package:warsha2/features/auth/presentation/views/login/widgets/login_body.dart';
export 'package:warsha2/features/auth/presentation/views/login/widgets/login_form.dart';
export 'package:warsha2/features/auth/presentation/views/login/widgets/login_header.dart';
export 'package:warsha2/features/auth/presentation/views/login/widgets/login_password.dart';
export 'package:warsha2/features/auth/presentation/views/register/register_view.dart';
export 'package:warsha2/features/auth/presentation/views/register/widgets/register_body.dart';
export 'package:warsha2/features/auth/presentation/views/register/widgets/register_form.dart';
export 'package:warsha2/features/auth/presentation/views/register/widgets/register_header.dart';
export 'package:warsha2/features/auth/presentation/views/register/widgets/register_password.dart';

// Home feature
export 'package:warsha2/features/home/presentation/views/home_view.dart';
export 'package:warsha2/features/home/presentation/views/widget/home_body.dart';

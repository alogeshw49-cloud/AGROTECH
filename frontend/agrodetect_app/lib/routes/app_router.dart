
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../features/auth/views/splash_screen.dart';
import '../features/auth/views/login_screen.dart';
import '../features/auth/views/register_screen.dart';
import '../features/scan/views/image_picker_screen.dart';
import '../features/scan/views/image_preview_screen.dart';
import '../features/scan/views/result_screen.dart';
import '../features/history/views/history_screen.dart';
import '../features/history/views/history_detail_screen.dart';
import '../features/dashboard/views/dashboard_screen.dart';
import '../features/profile/views/profile_screen.dart';
import '../features/profile/views/edit_profile_screen.dart';
import '../features/scan/models/prediction_result.dart';
import '../features/history/models/history_item.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const ImagePickerScreen(),
    ),
    GoRoute(
      path: '/preview',
      builder: (context, state) {
        final image = state.extra as XFile;
        return ImagePreviewScreen(image: image);
      },
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final image = extra['image'] as XFile;
        final result = extra['result'] as PredictionResult;
        return ResultScreen(image: image, result: result);
      },
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/history/detail',
      builder: (context, state) {
        final item = state.extra as HistoryItem;
        return HistoryDetailScreen(item: item);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (context, state) => const EditProfileScreen(),
    ),
  ],
);

export 'package:go_router/go_router.dart';

class RouteNames {
  // ---- AUTH ----
  static const splash = '/splash';
  static const login = '/login';
  static const adminLogin = '/login/email';
  static const phoneLogin = '/login/phone';
  static const phoneOtp = '/login/phone/otp';
  static const registerUser = '/login/register';

  // ---- ADMIN APP ----
  static const adminDashboard = 'admin_dashboard';
  static const items = '/items';
  static const itemCreate = 'item_create';
  static const itemUpdate = 'item_udate';
  static const users = '/users';
  

  // ---- Distributor APP ----
  static const distributorHome = 'distributor_home';

  static const settings = '/settings';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String notFound = '/not-found';
}

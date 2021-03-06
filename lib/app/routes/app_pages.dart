import 'package:get/get.dart';

import '../modules/beranda/bindings/beranda_binding.dart';
import '../modules/beranda/views/beranda_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hutang/bindings/hutang_binding.dart';
import '../modules/hutang/views/hutang_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pemasukan/bindings/pemasukan_binding.dart';
import '../modules/pemasukan/views/pemasukan_view.dart';
import '../modules/pengeluaran/bindings/pengeluaran_binding.dart';
import '../modules/pengeluaran/views/pengeluaran_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/setelan/bindings/setelan_binding.dart';
import '../modules/setelan/views/setelan_view.dart';
import '../modules/updatehutang/bindings/updatehutang_binding.dart';
import '../modules/updatehutang/views/updatehutang_view.dart';
import '../modules/updatepemasukan/bindings/updatepemasukan_binding.dart';
import '../modules/updatepemasukan/views/updatepemasukan_view.dart';
import '../modules/updatepengeluaran/bindings/updatepengeluaran_binding.dart';
import '../modules/updatepengeluaran/views/updatepengeluaran_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA,
      page: () => BerandaView(),
      binding: BerandaBinding(),
    ),
    GetPage(
      name: _Paths.SETELAN,
      page: () => SetelanView(),
      binding: SetelanBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PEMASUKAN,
      page: () => PemasukanView(),
      binding: PemasukanBinding(),
    ),
    GetPage(
      name: _Paths.PENGELUARAN,
      page: () => PengeluaranView(),
      binding: PengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.HUTANG,
      page: () => HutangView(),
      binding: HutangBinding(),
    ),
    GetPage(
      name: _Paths.UPDATEPEMASUKAN,
      page: () => UpdatepemasukanView(),
      binding: UpdatepemasukanBinding(),
    ),
    GetPage(
      name: _Paths.UPDATEPENGELUARAN,
      page: () => UpdatepengeluaranView(),
      binding: UpdatepengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.UPDATEHUTANG,
      page: () => UpdatehutangView(),
      binding: UpdatehutangBinding(),
    ),
  ];
}

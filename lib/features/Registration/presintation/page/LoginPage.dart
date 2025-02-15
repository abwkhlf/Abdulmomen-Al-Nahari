import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:versomarket/core/util/ScreenUtil.dart';
import 'package:versomarket/core/util/common.dart';
import 'package:versomarket/features/Product/presintation/page/productsPage.dart';
import '../../../../core/AppTheme.dart';
import '../../../../injection_container.dart';
import '../manager/Registration_bloc.dart';
import 'SinupPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  int itemisselected = 0;
  String valueInput = "";
  Widget ProductWidget = Container();
  ScreenUtil screenUtil = ScreenUtil();

  bool _obscurePassword = true;

  final TextEditingController _usrnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.deepOrange,
        title: Text("تسجيل الدخول",style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<Registration_bloc>(),
        child: BlocConsumer<Registration_bloc, RegistrationState>(
          listener: (context, state) {
            if (state is loginError) {
              print(state.errorMessage);
            }
            if (state is loginLoading) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.rightSlide,
                title: 'تسجيل الدخول',
                desc: 'جاري معالجة تسجيل الدخول، يرجى الانتظار...',
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        "يرجى الانتظار...",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )..show();
            }

            if (state is loginLoaded) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'تم تسجيل الدخول بنجاح',
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 50),
                      SizedBox(height: 16),
                      Text(
                        "${state.registrationModel.message}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )..show();
              cachedData(key: "token", data: state.registrationModel.token);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Product()));
            }

          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  textDirection: TextDirection.rtl,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Icon(
                          Icons.person_rounded,
                          size: 60,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _usrnameController,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: "اسم المستخدم",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Icon(Icons.person_outline),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: "كلمة المرور",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Icon(Icons.lock_outline),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                    ),

                    const SizedBox(height: 32),
                    Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<Registration_bloc>(context).add(
                          loginEvent(
                            username: _usrnameController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                    const SizedBox(height: 24),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SinupPage()),
                              );
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "سجل الآن",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "ليس لديك حساب؟",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:getxproject/view_model/Otp/Otp_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   child: CircleAvatar(
          //     child: Image.network(
          //       "data:image/jpeg;base64,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",

          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: Icon(Icons.phone),
                      labelText: "phone number",

                      hint: Text("1234567890"),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => OtpPage()));
                  },
                  child: Flexible(
                    child: Container(
                      height: 56,
                      width: 352,
                      decoration: BoxDecoration(
                        color: Colors.black87,

                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/home'),
                  child: Flexible(
                    child: Container(
                      height: 56,
                      width: 352,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          "Countinue as a guest",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

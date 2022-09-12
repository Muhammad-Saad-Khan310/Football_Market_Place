import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  Auth(this.submitfn, this.isLoading);

  final bool isLoading;
  final void Function(
    String name,
    String email,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) submitfn;

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _form = GlobalKey<FormState>();
  var _isLogin = false;
  var _name = "";
  var _email = "";
  var _password = "";

  void _submit() {
    if (!_form.currentState!.validate()) {
      // Invalid!
      return;
    }

    FocusScope.of(context).unfocus();
    _form.currentState!.save();
    widget.submitfn(
        _name.trim(), _email.trim(), _password.trim(), _isLogin, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              !_isLogin
                  ? "Sign up to get hired, find the best talent"
                  : "Log in to get hired, find the best talent",
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            _isLogin
                ? const Text("Log in",
                    style: TextStyle(fontWeight: FontWeight.bold))
                : const Text(
                    "Create your account",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

            // Name input field
            if (!_isLogin)
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(204, 204, 204, 1))),
                child: TextFormField(
                  key: const ValueKey("name"),
                  decoration: const InputDecoration(
                      hintText: "Name", border: InputBorder.none),
                  validator: (newValue) {
                    if (newValue!.isEmpty || newValue.length < 3) {
                      return "Please write at least 3 character name";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _name = newValue!;
                  },
                ),
              ),

            // Email input field
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromRGBO(204, 204, 204, 1))),
              child: TextFormField(
                key: const ValueKey("email"),
                decoration: InputDecoration(
                    hintText: "Email", border: InputBorder.none),
                validator: (newValue) {
                  if (newValue!.isEmpty || !newValue.contains("@")) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _email = newValue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromRGBO(204, 204, 204, 1))),
              child: TextFormField(
                key: const ValueKey("password"),
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_rounded),
                    hintText: "Password",
                    border: InputBorder.none),
                validator: (newValue) {
                  if (newValue!.isEmpty || newValue.length < 7) {
                    return "Please write at least 6 character password";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _password = newValue!;
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            if (widget.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),

            if (!widget.isLoading)
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: const Color.fromRGBO(67, 172, 106, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _submit();
                  },
                  child: _isLogin ? Text("LOG IN") : Text("SIGN UP")),
            SizedBox(
              height: 20,
            ),

            _isLogin
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text("Forgot password?")),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = false;
                            });
                          },
                          child: Text("Sign up for OnlyFans"))
                    ],
                  )
                : const Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                          "By signing up you agree to our Terms of services and Privacy policy , and confirm that you are at least 18 years old"),
                    ),
                  ),

            const Divider(),

            if (!_isLogin)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = true;
                        });
                      },
                      child: const Text("Log in"))
                ],
              ),

            _isLogin
                ? const SizedBox(
                    height: 55,
                  )
                : SizedBox(
                    height: 10,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: const Image(
                      image: AssetImage("assets/images/google.png")),
                ),
                Container(
                  width: 200,
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: const Center(
                      child: Text(
                    "Sign in with Google",
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

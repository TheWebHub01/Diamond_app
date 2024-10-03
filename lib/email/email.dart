import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart' as emailjs;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo EmailJS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(title: 'Flutter Demo EmailJS'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _sendEmail() async {
    try {
      await emailjs.send(
        'service_9zidnsm',
        'template_0lisc7r',
        {
          'to_email': 'shrddhakukadiya99094@gmail.com',
          'message': 'Hi',
          'mail': 'shrddhakukadiya99094@gmail.com'
        },
        const emailjs.Options(
            publicKey: 'xZukhLO6eMBmuqD1P',
            privateKey: '0DfjGJSwwUHG1b7v9yx-i',
            limitRate: emailjs.LimitRate(
              id: 'app',
              throttle: 10000,
            )),
      );
      print('SUCCESS!');
    } catch (error) {
      if (error is emailjs.EmailJSResponseStatus) {
        print('ERROR... $error');
      }
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press "Send Email" to send email',
            ),
            ElevatedButton(
              onPressed: _sendEmail,
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stage_two/edit_cv_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = "Ridwan Lawal";
  String slackUserName = "Ridwan Lawal";
  String githubUserName = "Reazy-ai";
  String personalBio =
      """I am an aspiring flutter developer that is passionate about creating user-friendly and visually appealing apps, and delivering high-quality Flutter projects.""";

  void updateData(Map<String, String> newData) {
    setState(() {
      fullName = newData['fullName']!;
      slackUserName = newData['slackUserName']!;
      githubUserName = newData['githubUserName']!;
      personalBio = newData["personalBio"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My CV"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCVScreen(
                      fullName: fullName,
                      slackUserName: slackUserName,
                      githubUserName: githubUserName,
                      personalBio: personalBio,
                      callBack: updateData,
                    ),
                  ),
                );
              },
              child: const Text(
                "Edit CV",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelText("Full Name"),
              const SizedBox(height: 10),
              MyText(fullName),
              const Divider(),
              const LabelText("Slack Username"),
              const SizedBox(height: 10),
              MyText(slackUserName),
              const Divider(),
              const LabelText("GitHub Username"),
              const SizedBox(height: 10),
              MyText(githubUserName),
              const Divider(),
              const LabelText("Personal Bio"),
              const SizedBox(height: 10),
              MyText(personalBio),
            ],
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

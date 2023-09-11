import 'package:flutter/material.dart';

class EditCVScreen extends StatefulWidget {
  const EditCVScreen({
    Key? key,
    required this.fullName,
    required this.slackUserName,
    required this.githubUserName,
    required this.personalBio,
    required this.callBack,
  }) : super(key: key);

  final String fullName;
  final String slackUserName;
  final String githubUserName;
  final String personalBio;
  final Function(Map<String, String>) callBack;

  @override
  State<EditCVScreen> createState() => _EditCVScreenState();
}

class _EditCVScreenState extends State<EditCVScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _slackUsernameController;
  late TextEditingController _githubUserNameController;
  late TextEditingController _personalBioController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _slackUsernameController =
        TextEditingController(text: widget.slackUserName);
    _githubUserNameController =
        TextEditingController(text: widget.githubUserName);
    _personalBioController = TextEditingController(text: widget.personalBio);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit details"),
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),
        body: WillPopScope(
          onWillPop: () async {
            widget.callBack({
              "fullName": _fullNameController.text,
              "slackUserName": _slackUsernameController.text,
              "githubUserName": _githubUserNameController.text,
              "personalBio": _personalBioController.text,
            });
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(labelText: "Fullname"),
                  ),
                  TextField(
                    controller: _slackUsernameController,
                    decoration:
                        const InputDecoration(labelText: "Slack Username"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _githubUserNameController,
                    decoration:
                        const InputDecoration(labelText: "GitHub Username"),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _personalBioController,
                    maxLines: 5,
                    decoration: const InputDecoration(labelText: "Bio"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _slackUsernameController.dispose();
    _githubUserNameController.dispose();
    _personalBioController.dispose();
    super.dispose();
  }
}

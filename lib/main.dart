import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: "Windows App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int tabs = 1;
  void printLog() {
    print("Hello");
  }

  List<NavigationPaneItem> items = [
    PaneItem(title: const Text("Home"), icon: const Icon(FluentIcons.home)),
    PaneItem(
        title: const Text("Profile"),
        icon: const Icon(FluentIcons.user_window)),
    PaneItem(
        title: const Text("Account"), icon: const Icon(FluentIcons.accounts)),
    PaneItem(
        title: const Text("Display"), icon: const Icon(FluentIcons.screen)),
  ];

  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        header: Text("Window App"),
        items: items,
        selected: index,
        footerItems: [
          PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text("Settings")),
        ],
        onChanged: (i) => setState(() => index = i),
        displayMode: PaneDisplayMode.compact,
      ),
      content: NavigationBody(index: index, children: [
        ScaffoldPage(
            header: Container(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Home"),
              ),
            ),
            content: Center(
              child: Button(
                  child: Text("Click ME"),
                  onPressed: () {
                    Navigator.push(
                        context, FluentPageRoute(builder: (context) => Load()));
                  }),
            )),
        const ScaffoldPage(
          content: Center(child: Text("Profile")),
        ),
        const ScaffoldPage(
          content: Center(child: Text("Account")),
        ),
        const ScaffoldPage(
          content: Center(child: Text("Display")),
        ),
        const ScaffoldPage(
          content: Center(child: Text("Settings")),
        ),
      ]),
    );
  }
}

class Load extends StatelessWidget {
  const Load({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Container(
        child: Row(
          children: [
            CupertinoNavigationBarBackButton(
              onPressed: () => Navigator.pop(context),
            ),
            Text("Loader")
          ],
        ),
      ),
      content: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

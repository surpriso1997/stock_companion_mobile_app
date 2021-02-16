import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  _buildPageItem(
      {@required String title, IconData icon, @required Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        disabledColor: Colors.transparent,
        disabledElevation: 0,
        hoverColor: Colors.transparent,
        color: Colors.transparent,
        splashColor: Theme.of(context).textSelectionColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        onPressed: onPressed,
        child: Container(
          height: 50,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(width: 20),
              Expanded(
                child: Text(title,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "roboto",
                      fontWeight: FontWeight.w600,
                      color:
                          // Theme.of(context).textSelectionColor
                          Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _hedingTitleColor = _theme.textSelectionColor;

    return CupertinoPageScaffold(
      backgroundColor: Color(0xff0D023B),
      // Theme.of(context).primaryColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).textSelectionColor,
        middle: Text(
          "Stock Companion",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("Tools",
                style: TextStyle(color: _hedingTitleColor, fontSize: 18)),
            _buildPageItem(
                title: 'Stock Screener',
                onPressed: () {},
                icon: AntDesign.filter),
            _buildPageItem(
                title: 'Top Brokers', onPressed: () {}, icon: Entypo.medal),
            _buildPageItem(
                title: 'Currency Converter',
                onPressed: () {},
                icon: FontAwesome.exchange),
            _buildPageItem(
                title: 'Calculator',
                onPressed: () {},
                icon: FontAwesome.calculator),
            SizedBox(height: 20),
            Text("About App",
                style: TextStyle(color: _hedingTitleColor, fontSize: 18)),
            SizedBox(height: 20),
            _buildPageItem(
                title: 'Rate Us', onPressed: () {}, icon: EvilIcons.star),
            _buildPageItem(
                title: 'Whats new', onPressed: () {}, icon: Entypo.new_icon),
            _buildPageItem(
                title: 'Help Center',
                onPressed: () {},
                icon: Feather.help_circle),
            _buildPageItem(
                title: 'Send Feedback',
                onPressed: () {},
                icon: MaterialIcons.feedback),
            _buildPageItem(
                title: 'Share App', onPressed: () {}, icon: Ionicons.ios_share),
            // _buildPageItem(title: 'Invite App', onPressed: (){},icon: ),
            _buildPageItem(
                title: 'T&C and Privacy Policy',
                onPressed: () {},
                icon: Icons.privacy_tip),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchirp/models/chirp_model.dart';
import 'package:flutterchirp/models/user_model.dart';

class ConversationScreen extends StatefulWidget {
  final User user;
  ConversationScreen({this.user});
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  _buildChirp(Chirp chirp, bool isMe) {

    final Container chirped = Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: isMe
            ? EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 80.0,
        )
            : EdgeInsets.only(top: 8.0, bottom: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )
              : BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              chirp.time,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              chirp.message,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));

    if (isMe) {
      return chirped;
    }
    return Row(
      children: <Widget>[
        chirped,
        IconButton(
          icon: chirp.isLoved
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color:
              chirp.isLoved ? Theme.of(context).primaryColor : Colors.blueGrey,
          onPressed: () {},
        ),
      ],
    );
  }

  _buildChirpComposer() {
    return Container(padding: EdgeInsets.symmetric(horizontal: 8.0),
    height: 70.0,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.photo),
          iconSize: 25.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {},
        ),
        Expanded(child: TextField(
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value) {

          },
          decoration: InputDecoration.collapsed(hintText: 'Send a message...'),
        ),),
        IconButton(
          icon: Icon(Icons.send),
          iconSize: 25.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {},
        )
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: chirps.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Chirp chirp = chirps[index];
                        bool isMe = chirp.sender.id == currentUser.id;
                        return _buildChirp(chirp, isMe);
                      }),
                ),
              ),
            ),
            _buildChirpComposer(),
          ],
        ),
      ),
    );
  }
}


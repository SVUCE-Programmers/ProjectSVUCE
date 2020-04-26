import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/models/user.dart';

class ClubListView extends StatefulWidget {
  final User user;

  const ClubListView({Key key, this.user}) : super(key: key);
  @override
  _ClubListViewState createState() => _ClubListViewState();
}

class _ClubListViewState extends State<ClubListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('clubs').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Club.fromSnapshot(data);

    return Card(
      child: ListTile(
        title: Text(record?.name),
        subtitle: Text(record.description.substring(0, 20)),
        isThreeLine: true,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(record.clubLogo),
        ),
        trailing: FlatButton(
            onPressed: () {
              followClub(data.documentID);
            }, child: Text("${record.followers} Followers")),
      ),
    );
  }

  followClub(String clubId) {
    Firestore.instance
        .collection("clubs")
        .document(clubId)
        .collection("followers")
        .document(widget.user.id)
        .setData({
          "notifyToken" : "token"
        });
  }
}

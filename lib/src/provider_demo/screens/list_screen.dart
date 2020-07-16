import 'package:flutter/material.dart';
import 'package:flutter_app/src/provider_demo/list_state.dart';
import 'package:flutter_app/src/provider_demo/user.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListState listState = Provider.of<ListState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: listState.isLoading ? buildProgress() : buildListView(listState),
      ),
    );
  }

  buildListView(ListState listState) {
    return ListView.builder(
      itemBuilder: (_, index) {
        User user = listState.getUsers[index];
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image.network(user.avatar),
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: listState.getUsers.length,
    );
  }

  buildProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

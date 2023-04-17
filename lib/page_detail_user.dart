import 'package:flutter/material.dart';
import 'api_data_source.dart';
import 'detail_user_model.dart';

class PageDetailUser extends StatelessWidget {
  final int idUser;
  const PageDetailUser({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User $idUser'),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadDetailUser(idUser),
        builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            DetailUserModel userModel = DetailUserModel.fromJson(snapshot.data);
            return _buildSuccessSection(userModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return const Text("ERROR");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(DetailUserModel user) {
    final userData = user.data!;
    return Container(
      child: _buildItemUsers(userData),
    );
  }

  Widget _buildItemUsers(Data userData) {
    return Container(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 100,
                child: Image.network(userData.avatar!),
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(userData.firstName! + " " + userData.lastName!),
                  Text(userData.email!),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

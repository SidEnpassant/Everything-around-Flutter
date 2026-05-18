import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Graphqlpage extends StatelessWidget {
  const Graphqlpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphQL Client'),
      ),

      body: Query(
        options: QueryOptions(
          document: gql(r'''
            query GetContinents {
              continents {
                name
              }
            }
          '''),
        ),

        builder: (
            QueryResult result, {
              VoidCallback? refetch,
              FetchMore? fetchMore,
            }) {

          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (result.hasException) {
            return Center(
              child: Text(result.exception.toString()),
            );
          }
          print(result.data!['continents']);

          return ListView.builder(
            itemCount: result.data!['continents'].length,
            itemBuilder: (context, index) {
              return Text("Data");
              // return ListTile(
              //   title: Text(continents[index]['name']),
              // );
            },
          );
        },
      ),
    );
  }
}
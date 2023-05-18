import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplefeb/statemanagemntusing_Provider/provider/MovieProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MovieProvider(),
    child: MaterialApp(home: Home()),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var movielist = context.watch<MovieProvider>().wishmovie;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                label:  Text("Go To WishList ${movielist.length}")),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(itemBuilder: (context, index) {
                  var movie = movies[index];
                  return Card(
                    key: ValueKey(movie.title),
                    child: ListTile(
                      title: Text(movie.title),
                      subtitle: Text(movie.time ?? "No time"),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite),
                        color: movielist.contains(movie)
                            ? Colors.red
                            : Colors.white,
                        onPressed: () {
                          if (!movielist.contains(movie)) {
                            context.read<MovieProvider>().addToList(movie);
                          } else {
                            context.read<MovieProvider>().removeFromList(movie);
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

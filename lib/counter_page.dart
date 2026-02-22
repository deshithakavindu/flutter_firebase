import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'blocs/counter/counter_bloc.dart';
import 'blocs/counter/counter_event.dart';
import 'blocs/counter/counter_state.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with Images')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          // Select image URL based on count
          String imageUrl;
          if (state.count > 0) {
            imageUrl =
                'https://i.ebayimg.com/images/g/AOAAAOSwtOVlEkiy/s-l1200.jpg'; // happy
          } else if (state.count < 0) {
            imageUrl =
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTaH8P5I2bICx26ccT4JwOzlPVuiUZtdjxHw&s'; // sad
          } else {
            imageUrl =
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbh54pE6JicwF0fl57OtVv8BLCGoTN3lXKQw&s'; // neutral
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 200,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 20),
                Text(
                  'Count: ${state.count}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementpressed());
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementpressed());
            },
          ),
        ],
      ),
    );
  }
}

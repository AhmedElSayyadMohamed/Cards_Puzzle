import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/datalayer/bloc.dart';
import 'package:puzzel/datalayer/states.dart';

class PuzzleGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var cubit = PuzzleBloc.get(context);
    return BlocConsumer<PuzzleBloc, PuzzleStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.22,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 40.0, top: 15, end: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'puzzle',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 40,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Icon(
                          Icons.flutter_dash,
                          color: Colors.blue[800],
                          size: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.access_alarms,
                              size: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '7',
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.directions_walk,
                              size: 35,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${cubit.countOfWalk}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Tile ",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${cubit.tile}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 5, end: 5, bottom: 20),
                  child: Card(
                    elevation: 80,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.46,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) =>
                              cubit.numbers[index] == 0
                                  ? const SizedBox.shrink()
                                  : buildCardItem(
                                      cubit.numbers[index], index, context),
                          itemCount: cubit.numbers.length,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: RaisedButton(
                    color: Colors.blue[700],
                    onPressed: () {
                      cubit.Shuffle_Numbers();
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.cached,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Shuffle",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildCardItem(int num, index, context) {
  var cubit = PuzzleBloc.get(context);
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      cubit.move_card(index);
      cubit.playerWin();
      print(cubit.countOfWalk);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[700],
      ),
      child: Center(
        child: Text(
          '${num}',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

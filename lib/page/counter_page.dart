import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 import 'package:massenger/man.dart';
   final x= ChangeNotifierProvider<Man>((rf)=>Man());
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "data",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Consumer(
                builder: (context, w, _) => Text(
                      w.watch(x).g.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.red),
                    )), 
          ),
          Consumer(builder: (context,w,_){
            var s=w.watch(x);
            return StreamBuilder(stream: s.ali(), builder: (context, snapshot) {
              if(snapshot.hasData) return Text(snapshot.data.toString());
              return const Text("no date");
            });

          }),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer(
                builder: (context, w, _) {
 
                  return ElevatedButton(
                      onPressed: () {
                        w.read(x).inc();
                      },
                      child: Text(
                        "+",
                        style: Theme.of(context).textTheme.displayMedium,
                      ));
                },
              ),
              Consumer(
                builder: (context, w, _) => ElevatedButton(
                    onPressed: () {
                      w.read(x).dec();
                      // w.watch(x.notifier);
                    },
                    child: Text(
                      "-",
                      style: Theme.of(context).textTheme.displayMedium,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

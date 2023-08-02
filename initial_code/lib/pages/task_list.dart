import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do'),
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('To do'),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                width: 80.0, // Defina a largura desejada aqui
                color: Colors.lightBlue,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 40,
                  separatorBuilder: (context, index) => SizedBox(height: 20.0), // Espaço de 10 pixels entre os itens
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('List Item $index'),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

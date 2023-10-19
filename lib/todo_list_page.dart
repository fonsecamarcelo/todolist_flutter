import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  TextEditingController _textEditingController = TextEditingController();
  List<String> listaDeTarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
          Container(
            height: 163,
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: listaDeTarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listaDeTarefas[index]),
                    onLongPress: () {
                      setState(() {
                        listaDeTarefas.removeAt(index);
                      });
                    },
                  );
                }
            ),
          )
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              if(_textEditingController.text.length > 0) {
                setState(() {
                  listaDeTarefas.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: Icon(Icons.done),
          ),
          SizedBox(
            width: 16, // Ajuste esse valor para definir o espaçamento desejado
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
                setState(() {
                  listaDeTarefas = [];
                });
                _textEditingController.clear();
            },
            child: Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}

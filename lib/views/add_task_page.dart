import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
        child: BlocProvider(
          create: (context) => MyAppCubit(),
          child: BlocSelector<MyAppCubit, TaskState, List<Task>>(
            selector: (state) => state.task,
            builder: (context, taskList) {
              return Column(
                children: [
                  const ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tuesday, 9th',
                          style: TextStyle(
                            color: Color.fromARGB(255, 69, 188, 235),
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'February',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 124, 122, 122),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          onChanged: (value) =>
                              context.read<MyAppCubit>().setName(value),
                          decoration: InputDecoration(
                            hintText: 'Agregar tarea...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          context.read<MyAppCubit>().addName();
                          controller.clear();
                        },
                        icon: const Icon(Icons.add, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                   Expanded(
                    child: ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(
                            taskList[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              decoration: taskList[index].isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          value: taskList[index].isCompleted,
                          onChanged: (value) {
                            context.read<MyAppCubit>().toggleTask(index);
                          },
                          activeColor: Colors.blue,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


class Task {
  final String name;
  final bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class TaskState {
  final String? currentTask;
  final List<Task> task;

  TaskState({this.currentTask = '', required this.task});
}

class MyAppCubit extends Cubit<TaskState> {
  MyAppCubit() : super(TaskState(task: []));

  void setName(String name) {
    emit(TaskState(task: state.task, currentTask: name));
  }

  void addName() {
    if (state.currentTask?.isEmpty ?? true) return;
    final newTask = Task(name: state.currentTask!);
    emit(TaskState(task: [...state.task, newTask]));
  }

  void toggleTask(int index) {
    final updatedTasks = List<Task>.from(state.task);
    updatedTasks[index] = Task(
      name: updatedTasks[index].name,
      isCompleted: !updatedTasks[index].isCompleted,
    );
    emit(TaskState(task: updatedTasks));
  }
}
// test


/*class Persona{
  String nombre;
  String? apellido;
  int? edad;
  Persona(this.nombre,{this.apellido, this.edad});
}

final brian = Persona('brian', apellido: 'Notrabaja', edad: 58);

class Servivo{
  Persona humano;

  Servivo({required this.humano});
}

final homosapien = Servivo(humano: brian); */
import 'package:flutter/material.dart';
import 'package:nationalizations/constants/app_values_design.dart';

import 'package:nationalizations/widgets/widgets.dart';

class TaskWidget extends StatefulWidget {

  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() { 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.only(top: 30, left: 30, right: 30),
      child   : Column(
        children: [
          Padding(
            padding : const EdgeInsets.symmetric(vertical: 10),
            child   : ListView.builder(
              shrinkWrap  : true,
              itemCount   : 3,
              itemBuilder : (BuildContext context, int index) {
                return const TodoItemWidget(ownTask: false);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TaskReferencesHeader extends StatelessWidget {

  final int referencesFlex;
  final String referenceTitle;
  final void Function() onPressed;

  const TaskReferencesHeader({
    this.referencesFlex = 1,
    required this.referenceTitle,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex  : this.referencesFlex,
      child : Row(
        children: [
          Padding(
            padding : const EdgeInsets.only(right: 3),
            child   : MaterialButton(
              padding      : EdgeInsets.zero,
              minWidth     : 10,
              onPressed    : this.onPressed,
              shape        : const CircleBorder(),
              child        : const Icon(Icons.arrow_drop_down_outlined),
            ),
          ),
          Text(this.referenceTitle)
        ],
      ),
    );
  }
}

class TodoItemWidget extends StatefulWidget {

  final bool ownTask;

  const TodoItemWidget({
    required this.ownTask,
    super.key
  });

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {

  double _currentHeight = 0;

  final double _expandedHeight = 100;

  void _expandOnChanged() {
    bool isExpanded = _currentHeight == _expandedHeight;
    setState(() {
      _currentHeight = isExpanded ? 0 : _expandedHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color        : graphicsBgColor,
        borderRadius : BorderRadius.circular(10),
      ),
      margin : const EdgeInsets.all(6),
      child  : InkWell(
        borderRadius : BorderRadius.circular(11),
        onTap        : _expandOnChanged,
        child        : Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  const ClientNameItem(),
                  const EndDateItem(),
                  const StatusItem(),
                  const PriorityItem(),
                  const ProgressItem(),
                  IconButton(
                    icon      : const Icon(Icons.more_vert),
                    onPressed : () => _removeActivityDialog(context),
                  ),
                ],
              ),
            ),
            TasksContainerList(currentHeight: _currentHeight),
          ],
        )
      ),
    );
  }

  Future<void> _removeActivityDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => TaskDialog(
        dialogButtonColor : Colors.red,
        dialogTitle       : "Remove task",
        dialogButtonTitle : "Remove",
        onPressed         : () => Navigator.pop(context),
        dialogContent     : const Text('Are you sure you want to remove this task?')
      )
    );
  }
}

class TasksContainerList extends StatelessWidget {

  final double currentHeight;

  const TasksContainerList({
    required this.currentHeight,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color        : graphicsBgColor,
        borderRadius : const BorderRadius.vertical(
          bottom: Radius.circular(10)
        ),
      ),
      height    : this.currentHeight,
      width     : double.infinity,
      curve     : Curves.fastOutSlowIn,
      duration  : const Duration(milliseconds: 150),
      alignment : Alignment.center,
      child     : const Text('Expandable Body'),
    );
  }
}

class ClientNameItem extends StatelessWidget {

  const ClientNameItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child : Container(
        margin : const EdgeInsets.only(left: 15),
        child  : const Padding(
          padding : EdgeInsets.symmetric(horizontal: 6),
          child   : Text(
            "Client name",
            style: TextStyle(color: Colors.white60),
          ),
        ),
      ),
    );
  }
}

class EndDateItem extends StatelessWidget {

  const EndDateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child : Container(
        margin : const EdgeInsets.only(left: 20),
        child  : const Padding(
          padding : EdgeInsets.symmetric(horizontal: 20),
          child   : Text(
            "30/02/2023",
            style: TextStyle(color: Colors.white60),
          ),
        ),
      ),
    );
  }
}

class StatusItem extends StatelessWidget {

  const StatusItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child : Container(
        margin     : const EdgeInsets.only(left: 20),
        height     : 25,
        decoration : BoxDecoration(
            color        : Colors.blueAccent,
            borderRadius : BorderRadius.circular(10)
        ),
        child      : const Center(
          child: Text(
            "In Progress",
            style: TextStyle(color: Colors.white60),
          ),
        ),
      ),
    );
  }
}

class PriorityItem extends StatelessWidget {

  const PriorityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child : Container(
        margin : const EdgeInsets.only(left: 20),
        child  :   const Padding(
          padding : EdgeInsets.symmetric(horizontal: 25),
          child   : Center(
            child: Icon(
              Icons.flag,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressItem extends StatelessWidget {

  const ProgressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child : Container(
        margin : const EdgeInsets.symmetric(horizontal: 25),
        width  : 50,
        height : 50,
        child  : Stack(
          children: [
            Center(
                child: TweenAnimationBuilder(
                  tween    : Tween(begin: 0.0, end: 0.3),
                  duration : const Duration(milliseconds: 500),
                  builder  : (context, value, _) => CircularProgressIndicator(
                    value           : value,
                    backgroundColor : Colors.black,
                    color           : Colors.green,
                  ),
                )),
            const Center(
              child: Text(
                "25%",
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';

class TaskWidget extends StatelessWidget {

  const TaskWidget({super.key});

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
                return const ClientTasksContainer();
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*class TaskReferencesHeader extends StatelessWidget {

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
}*/

class ClientTasksContainer extends StatefulWidget {

  const ClientTasksContainer({super.key});

  @override
  State<ClientTasksContainer> createState() => _ClientTasksContainerState();
}

class _ClientTasksContainerState extends State<ClientTasksContainer> {

  double _currentHeight = 0;

  int index = 6;

  final double _expandedHeight = 50;

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
        color        : drawerColor,
        borderRadius : BorderRadius.circular(10),
      ),
      margin : const EdgeInsets.all(6),
      child  : InkWell(
        splashColor  : Colors.transparent,
        borderRadius : BorderRadius.circular(11),
        onTap        : _expandOnChanged,
        child        : Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  const ClientNameTask(),
                  const EndDateTask(),
                  const StatusTask(),
                  const PriorityTask(),
                  const ProgressTask(),
                  IconButton(
                    icon      : const Icon(Icons.more_vert),
                    onPressed : () {},
                  ),
                ],
              ),
            ),
            ClientTaskList(currentHeight: _currentHeight, index: index),
          ],
        )
      ),
    );
  }
}

class ClientNameTask extends StatelessWidget {

  const ClientNameTask({super.key});

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

class EndDateTask extends StatelessWidget {

  const EndDateTask({super.key});

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

class StatusTask extends StatelessWidget {

  const StatusTask({super.key});

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

class PriorityTask extends StatelessWidget {

  const PriorityTask({super.key});

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

class ProgressTask extends StatelessWidget {

  const ProgressTask({super.key});

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
                  tween    : Tween(begin: 0.0, end: 1.0),
                  duration : const Duration(milliseconds: 500),
                  builder  : (context, value, _) => CircularProgressIndicator(
                    value           : value,
                    backgroundColor : Colors.black,
                    color           : Colors.green,
                  ),
                )),
            const Center(
              child: 1 == 0 ? Text(
                "25%",
                style: TextStyle(fontSize: 12),
              ) : Icon(Icons.check),
            )
          ],
        ),
      ),
    );
  }
}

class ClientTaskList extends StatelessWidget {

  final double currentHeight;
  final int index;

  const ClientTaskList({
    required this.index,
    required this.currentHeight,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration : BoxDecoration(
        color        : graphicsBgColor,
        borderRadius : const BorderRadius.vertical(
          bottom: Radius.circular(10)
        ),
      ),
      height    : this.currentHeight * this.index,
      width     : double.infinity,
      curve     : Curves.fastOutSlowIn,
      duration  : const Duration(milliseconds: 150),
      alignment : Alignment.center,
      child     : ListView.builder(
        itemCount   : index,
        itemBuilder : (context, index){
          return const ItemsTask();
        }
      ),
    );
  }
}

class ItemsTask extends StatelessWidget {

  const ItemsTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height  : 50,
      padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child   : Row(
        children: [
          Checkbox(
            activeColor : Colors.greenAccent,
            checkColor  : scaffoldColor,
            value       : true,
            onChanged   : (value){}
          ),
          const Padding(
            padding : EdgeInsets.symmetric(horizontal: 10),
            child   : Text(
              "Registrar arbol genealogico",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
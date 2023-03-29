import 'package:flutter/material.dart';
import 'package:nationalizations/constants/app_values_design.dart';

import 'package:nationalizations/widgets/widgets.dart';

class NotesWidget extends StatefulWidget {

  const NotesWidget({super.key});

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {

  final TextEditingController titleNoteController = TextEditingController();
  final TextEditingController descriptionNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleNoteController.dispose();
    descriptionNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.only(top: 30, left: 30, right: 30),
      child   : Column(
        children: [
          Row(
            children: [
              NotesButtons(
                buttonIcon  : Icons.add,
                buttonTitle : "New Note",
                onPressed   : () => _addNoteDialog(context)
              ),
              NotesButtons(
                buttonIcon  : Icons.delete,
                buttonTitle : "Remove all notes",
                onPressed   : () => _removeAllNotesDialog(context)
              ),
            ],
          ),
          Padding(
            padding : const EdgeInsets.symmetric(vertical: 10),
            child   : ListView.builder(
              shrinkWrap  : true,
              itemCount   : 2,
              itemBuilder : (context, index){
                return const NotesContainer();
              }
            ),
          )
        ],
      ),
    );
  }

  Future<void> _addNoteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => NoteDialog(
        dialogButtonColor : scaffoldColor,
        dialogTitle       : "Add Note",
        dialogButtonTitle : "Save",
        onPressed         : (){},
        dialogContent     : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller         : titleNoteController,
              keyboardType       : TextInputType.multiline,
              maxLines           : null,
              textCapitalization : TextCapitalization.sentences,
              decoration         : const InputDecoration(
                hintText: "Title note..",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller         : descriptionNoteController,
              keyboardType       : TextInputType.multiline,
              maxLines           : null,
              textCapitalization : TextCapitalization.sentences,
              decoration         : const InputDecoration(
                hintText: "Description note..",
                border: OutlineInputBorder(),
              ),
            )
          ],
        )
      )
    );
  }

  Future<void> _removeAllNotesDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => NoteDialog(
        dialogButtonColor : scaffoldColor,
        dialogTitle       : "Remove all notes",
        dialogButtonTitle : "Remove",
        onPressed         : (){},
        dialogContent     : const Text('Are you sure you want to remove all notes?'),
      )
    );
  }
}


class NotesContainer extends StatefulWidget {

  const NotesContainer({super.key});

  @override
  State<NotesContainer> createState() => _NotesContainerState();
}

class _NotesContainerState extends State<NotesContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding    : const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin     : const EdgeInsets.symmetric(vertical: 10),
      decoration : BoxDecoration(
        borderRadius : BorderRadius.circular(10),
        color        : drawerColor,
      ),
      child      : Column(
        children: [
          Row(
            crossAxisAlignment : CrossAxisAlignment.center,
            children           : [
              const Expanded(
                child: Text(
                  "Solicitar mas documentacion al cliente XXX",
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),
              ),
              IconButton(
                icon         : const Icon(Icons.delete),
                splashRadius : 10,
                onPressed    : () => setState(() {}),
              ),
            ],
          ),
          const NoteDescription()
        ],
      ),
    );
  }
}

class NoteDescription extends StatelessWidget {

  const NoteDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Description",
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt "
                  "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco "
                  "laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in "
                  "voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat "
                  "non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            ),
          ],
        ),
      );
  }
}

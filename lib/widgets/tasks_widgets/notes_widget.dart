import 'package:flutter/material.dart';


class NotesWidget extends StatefulWidget {

  const NotesWidget({super.key});

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {

  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Notes",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            ElevatedButton.icon(
              label: const Text(
                "New note",
              ),
              icon: const Icon(Icons.add),
              onPressed: () => _addNoteDialog(context),
            ),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text(
                "Remove all notes",
              ),
              onPressed: () => _removeAllNotesDialog(context),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 12,
                    child: Text(
                      "w",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Future<String?> _removeAllNotesDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Remove all notes'),
        content: const Text('Are you sure you want to remove all notes?'),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
            {noteController.text = '', Navigator.pop(context)},
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  Future<String?> _addNoteDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add note'),
        content: TextField(
          controller: noteController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            hintText: "Type something ...",
            border: OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
            {noteController.text = '', Navigator.pop(context)},
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                noteController.text = '';
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
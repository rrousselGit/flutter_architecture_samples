// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/hook.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks/models.dart';

part 'home_screen.g.dart';

@widget
Widget homeScreen(
  HookContext context, {
  AppState appState,
  dynamic addTodo,
  dynamic removeTodo,
  dynamic updateTodo,
  dynamic toggleAll,
  dynamic clearCompleted,
}) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Hello World"),
    ),
  );
}

// class HomeScreen extends StatefulWidget {
//   final AppState appState;
//   final TodoAdder addTodo;
//   final TodoRemover removeTodo;
//   final TodoUpdater updateTodo;
//   final Function toggleAll;
//   final Function clearCompleted;

//   HomeScreen({
//     @required this.appState,
//     @required this.addTodo,
//     @required this.removeTodo,
//     @required this.updateTodo,
//     @required this.toggleAll,
//     @required this.clearCompleted,
//     Key key,
//   }) : super(key: ArchSampleKeys.homeScreen);

//   @override
//   State<StatefulWidget> createState() {
//     return HomeScreenState();
//   }
// }

// class HomeScreenState extends State<HomeScreen> {
//   VisibilityFilter activeFilter = VisibilityFilter.all;
//   AppTab activeTab = AppTab.todos;

//   _updateVisibility(VisibilityFilter filter) {
//     setState(() {
//       activeFilter = filter;
//     });
//   }

//   _updateTab(AppTab tab) {
//     setState(() {
//       activeTab = tab;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(hooksLocalizations.of(context).appTitle),
//         actions: [
//           FilterButton(
//             isActive: activeTab == AppTab.todos,
//             activeFilter: activeFilter,
//             onSelected: _updateVisibility,
//           ),
//           ExtraActionsButton(
//             allComplete: widget.appState.allComplete,
//             hasCompletedTodos: widget.appState.hasCompletedTodos,
//             onSelected: (action) {
//               if (action == ExtraAction.toggleAllComplete) {
//                 widget.toggleAll();
//               } else if (action == ExtraAction.clearCompleted) {
//                 widget.clearCompleted();
//               }
//             },
//           )
//         ],
//       ),
//       body: activeTab == AppTab.todos
//           ? TodoList(
//               filteredTodos: widget.appState.filteredTodos(activeFilter),
//               loading: widget.appState.isLoading,
//               removeTodo: widget.removeTodo,
//               addTodo: widget.addTodo,
//               updateTodo: widget.updateTodo,
//             )
//           : StatsCounter(
//               numActive: widget.appState.numActive,
//               numCompleted: widget.appState.numCompleted,
//             ),
//       floatingActionButton: FloatingActionButton(
//         key: ArchSampleKeys.addTodoFab,
//         onPressed: () {
//           Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
//         },
//         child: Icon(Icons.add),
//         tooltip: ArchSampleLocalizations.of(context).addTodo,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         key: ArchSampleKeys.tabs,
//         currentIndex: AppTab.values.indexOf(activeTab),
//         onTap: (index) {
//           _updateTab(AppTab.values[index]);
//         },
//         items: AppTab.values.map((tab) {
//           return BottomNavigationBarItem(
//             icon: Icon(
//               tab == AppTab.todos ? Icons.list : Icons.show_chart,
//               key: tab == AppTab.stats
//                   ? ArchSampleKeys.statsTab
//                   : ArchSampleKeys.todoTab,
//             ),
//             title: Text(
//               tab == AppTab.stats
//                   ? ArchSampleLocalizations.of(context).stats
//                   : ArchSampleLocalizations.of(context).todos,
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
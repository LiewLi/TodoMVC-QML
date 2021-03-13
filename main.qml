import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import todoItem 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ToDoX")
    color: "#FF1C1C1E"

    ColumnLayout {
        id: container
        anchors.fill: parent
        spacing: 0
        AddDialog {
            id: addTodoDialog
        }

        TodoListView {
            id: listview
            model: mymodel
            Layout.preferredHeight: parent.height - 60
            onClick: {
                console.log("clicked", index)
                listview.currentIndex = index
            }
            onDoubleClick: {
                var q_index = mymodel.index(listview.currentIndex, 0)
                var data = mymodel.data(q_index, 0)
                addTodoDialog.newTodo(data.title)
            }
        }

        TodoToolBar {
            Layout.preferredHeight: 60
            TodoItem {
                title: "New Todo"
                status: TodoItem.normal
                id: todo
            }
            onAdd: {
                mymodel.addTodo(todo)
            }

            onDel: {
                var q_index = mymodel.index(listview.currentIndex, 0)
                mymodel.deleteTodo(q_index)
            }

            onToggle: {
                var q_index = mymodel.index(listview.currentIndex, 0)
                mymodel.toggleTodo(q_index)
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Dialog {
    parent: Overlay.overlay
    modal: true
    id: newTodoDialog
    title: "New Todo"
    width: parent.width
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    focus: true

    Column {
        anchors.fill: parent
        TextField {
            id: newTodoInput
            width: parent.width
            focus: true

            onEditingFinished: {
                console.log("finished:", newTodoInput.text)
                var q_index = mymodel.index(listview.currentIndex, 0)
                mymodel.updateTodoTitle(q_index, newTodoInput.text)
                newTodoDialog.close()
            }
        }
    }

    function newTodo(initText) {
        newTodoDialog.open()
        newTodoInput.focus = true
        newTodoInput.forceActiveFocus()
        newTodoInput.text = initText
    }
}

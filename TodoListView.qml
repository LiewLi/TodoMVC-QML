import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

ListView {
    id: listview
    signal click(int index)
    signal doubleClick (int index)

    ScrollBar.vertical: ScrollBar {
        active: true
    }
    flickableDirection: Flickable.VerticalFlick
    boundsBehavior: Flickable.StopAtBounds
    Layout.preferredWidth: parent.width
    clip: true
    focus: true
    highlightMoveDuration: 100
    highlightMoveVelocity: 2000

    delegate: TodoCell {

        text: display.title
        status: display.status

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listview.click(index)
            }
            onDoubleClicked: {
                listview.doubleClick(index)
            }
        }
    }
    highlight: Rectangle {
        color: "darkcyan"
    }
}

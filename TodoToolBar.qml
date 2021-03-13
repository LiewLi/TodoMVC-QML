import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.30
import todoItem 1.0

Item {
    id: root
    signal add
    signal del
    signal toggle
    Layout.preferredWidth: parent.width

    RowLayout {
        anchors.fill: parent
        spacing: 2
        Button {
            text: qsTr("Add")
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                root.add()
            }
        }

        Button {
            text: qsTr("Delete")
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: {
                root.del()
            }
        }

        Button {
            text: qsTr("Toggle")
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                root.toggle()
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {

   id: container
   property alias text: txt.text
   property int status: 0

   width: parent.width
   height:100
   color: "transparent"
   TextEdit {
       id: txt
       text: ""
       width: parent.width
       height: parent.height
       x: 10
       verticalAlignment: Text.AlignVCenter
       font.bold: true
       font.strikeout: container.status == 2
       color: status == 0 ? "white" : "gray"
       font.italic: status == 2
       font.family: "Helvetica"
       font.pixelSize: 30
   }

}


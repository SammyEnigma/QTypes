import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12


// ###########################################
// [1][ADD] - import QtQmlPlugins
import "qrc:/QTypes" as QTypes
// [END] #####################################

Flickable {
     width: 200; height: 200
     contentWidth: item.width
     contentHeight: item.height

    Item {
        id: item
        width: 2000
        height: 2000

        // ###########################################
        // [2][ADD] - JumpTo

        Text {
            id: idtest
            text: qsTr("JumpTo 1200,800")

            MouseArea {
                anchors.fill: parent
                QTypes.JumpTo { target: "pos1200x800" }
            }
        }

        Rectangle {
            id: pos1200x800
            x: 1200
            y: 800
            width: 10
            height: 10
            color: "red"
        }

    }
}

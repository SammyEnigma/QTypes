import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12


// ###########################################
// [1][ADD] - import QTypes
import "qrc:/QTypes" as QTypes
// [END] #####################################

ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
        Layout.alignment: Qt.AlignHCenter
        Layout.fillHeight: true

        // ###########################################
        // [2][ADD] - ImageSync

        QTypes.ImageLoader {
            id: image
            source: "https://upload.wik_imedia.org/wikipedia/commons/a/a0/%27Greeley_Panorama%27_from_Opportunity%27s_Fifth_Martian_Winter%2C_PIA15689.jpg"
        }

        Label {
            id: label
            text: qsTr("Example not found image")
            Layout.alignment: Qt.AlignHCenter
        }

        Timer {
            interval: 3000
            running: true
            onTriggered: {
                label.text = qsTr("Example loading a large image")
                image.source = "https://upload.wikimedia.org/wikipedia/commons/a/a0/%27Greeley_Panorama%27_from_Opportunity%27s_Fifth_Martian_Winter%2C_PIA15689.jpg"
            }
        }
    }
}

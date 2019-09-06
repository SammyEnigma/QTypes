import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12


// ###########################################
// [1][ADD] - import QtQmlPlugins
import "qrc:/QTypes" as QTypes
// [END] #####################################

Item {

    // ###########################################
    // [2][ADD] - Icon
    Column {
        anchors.centerIn: parent
        spacing: 20

        QTypes.Icon {
            side: 24
            name: "home_work" // get the title of icon in https://www.material.io/resources/icons/
        }

        QTypes.Icon {
            name: "clear"
        }

        QTypes.Icon {
            side: 24
            name: "add_circle"
            color: "red"
        }
    }
}

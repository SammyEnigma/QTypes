import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12


// ###########################################
// [1][ADD] - import QtQmlPlugins
import "qrc:/QTypes" as QTypes
// [END] #####################################

ColumnLayout {
    Layout.fillWidth: true

    ColumnLayout {
        Layout.fillWidth: true
        spacing: 5

        // ###########################################
        // [2][ADD] - Badge Control

        QTypes.Badge {
            label.text: "My Badge default"
        }
        QTypes.Badge {
            label.text: "My Badge primary"
            state: "primary"
        }
        QTypes.Badge {
            label.text: "My Badge secondary"
            state: "secondary"
        }
        QTypes.Badge {
            label.text: "My Badge success"
            state: "success"
        }
        QTypes.Badge {
            label.text: "My Badge danger"
            state: "danger"
        }
        QTypes.Badge {
            label.text: "My Badge warning"
            state: "warning"
        }
        QTypes.Badge {
            label.text: "My Badge info"
            state: "info"
            lightLabel.text: "23"
        }
        QTypes.Badge {
            label.text: "My Badge light"
            state: "light"
        }
        QTypes.Badge {
            label.text: "My Badge dark"
            state: "dark"
        }
    }
}

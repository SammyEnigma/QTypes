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
            lightLabel.text: "23"
        }
        QTypes.Badge {
            label.text: "My Badge warning"
            state: "warning"
        }
        QTypes.Badge {
            label.text: "My Badge info"
            state: "info"
        }
        QTypes.Badge {
            label.text: "My Badge light"
            state: "light"
        }
        QTypes.Badge {
            label.text: "My Badge dark"
            state: "dark"
            lightLabel.text: "23"
        }
        QTypes.Badge {
            label.text: "My Big advanced"
            label.font.bold: true
            label.font.pixelSize: 20
            label.color: "#EEEEEE"
            color: "#FF5722"
            lightLabel.text: "01"
        }
        QTypes.Badge {
            label.text: "My Mini advanced"
            label.font.bold: true
            label.font.pixelSize: 10
            label.color: "#000"
            color: "#607D8B"
            lightLabel.text: "01"
        }
        QTypes.Badge {
            label.text: "My Pill Badge"
            state: "info"
            pill: true
            lightLabel.text: "23"
        }
    }
}

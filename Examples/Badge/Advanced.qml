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
        // [2][ADD] - Badge

        QTypes.Badge {
            text: "Default"
        }
        QTypes.Badge {
            text: "Primary"
            state: "primary"
        }
        QTypes.Badge {
            text: "Secondary"
            state: "secondary"
        }
        QTypes.Badge {
            text: "Success"
            state: "success"
        }
        QTypes.Badge {
            text: "Danger"
            state: "danger"
            counterText: "23"
        }
        QTypes.Badge {
            text: "Warning"
            state: "warning"
        }
        QTypes.Badge {
            text: "Info"
            state: "info"
        }
        QTypes.Badge {
            text: "Light"
            state: "light"
        }
        QTypes.Badge {
            text: "Dark"
            state: "dark"
            counterText: "23"
        }
        QTypes.Badge {
            label.text: "Pill Badge"
            state: "info"
            pill: true                    // enable badge more rounded
            counterLabel.text: "23"
        }
        QTypes.Badge {
            color: "#FF5722"              // badge background color
            label.text: "Advanced"        // Same like alias text: "Advanced"
            label.font.bold: true         // badge text bold
            label.font.pixelSize: 20      // badge text pixelSize
            label.color: "#EEEEEE"        // badge text background color
            counterLabel.text: "01"       // counter text same alias counterText: "Advanced"
            counterLabel.color: "red"     // counter color text
            counter.border {
                width: 1                  // counter border width
                color: "#000"             // counter border color
            }
        }
        QTypes.Badge {
            label.text: "My Mini advanced"
            label.font.bold: true
            label.font.pixelSize: 10
            label.color: "#000"
            color: "#607D8B"
            counterLabel.text: "01"
        }
    }
}

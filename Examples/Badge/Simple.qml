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
        }
        QTypes.Badge {
            label.text: "Profile"
            state: "info"
            counterText: "9"      // add counter
        }
        QTypes.Badge {
            text: "Pill Badge"
            state: "info"
            pill: true           // enable badge more rounded
        }
    }
}

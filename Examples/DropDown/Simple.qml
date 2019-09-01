import QtQuick 2.12
import QtQuick.Controls 2.12


// ###########################################
// [1][ADD] - import QtQmlPlugins
import "qrc:/QTypes" as QTypes
// [END] #####################################

Rectangle {

    // ###########################################
    // [2][ADD] - DropDown

    Button{
        anchors.centerIn: parent
        text: "Dropdown button"
        onClicked: dropDown1.toggle()

        QTypes.DropDown {
            id: dropDown1

            MenuItem {
                text: "New..."
                onTriggered: {

                }
            }

            MenuItem {
                text: "Open..."
            }
            MenuItem {
                text: "Save"
            }

            MenuSeparator{}

            MenuItem {
                text: "Preferences..."
            }
        }
    }
}

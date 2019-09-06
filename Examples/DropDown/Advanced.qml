import QtQuick 2.12
import QtQuick.Controls 2.12


// ###########################################
// [1][ADD] - import QtQmlPlugins
import "qrc:/QTypes" as QTypes
// [END] #####################################

Rectangle {

    // ###########################################
    // [2][ADD] - DropDown

    Text {
        text: "DropDown in text"
        MouseArea {
            anchors.fill: parent
            onClicked: dropDownText.toggle()

            QTypes.DropDown {
                id: dropDownText

                MenuItem {
                    text: "New..."
                }
                MenuItem {
                    text: "Open..."
                }
                MenuItem {
                    text: "Save"
                }
            }
        }
    }

    Button{
        anchors.centerIn: parent
        text: "Dropdown button"
        onClicked: dropDown1.toggle()

        QTypes.DropDown {
            id: dropDown1

            MenuItem {
                text: "New..."
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


        LayoutMirroring.enabled: true
        QTypes.Icon {
            name: parent.checked ? "expand_less" : "expand_more"
            color: parent.checked ? "#FFF" : "#000"
        }
    }

    Button{
        anchors.right: parent.right
        anchors.top: parent.top
        text: "Dropdown button"
        onClicked: dropDown2.toggle()

        QTypes.DropDown {
            id: dropDown2

            MenuItem {
                text: "New..."
            }
            MenuItem {
                text: "Open..."
            }
            MenuItem {
                text: "Save"
            }
        }

        LayoutMirroring.enabled: true
        QTypes.Icon {
            name: parent.checked ? "expand_less" : "expand_more"
            color: parent.checked ? "#FFF" : "#000"
        }
    }

    Button{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        text: "Dropdown button"
        onClicked: dropDown3.toggle()

        QTypes.DropDown {
            id: dropDown3

            MenuItem {
                text: "New..."
            }
            MenuItem {
                text: "Open..."
            }
            MenuItem {
                text: "Save"
            }
        }

        LayoutMirroring.enabled: true
        QTypes.Icon {
            name: parent.checked ? "expand_less" : "expand_more"
            color: parent.checked ? "#FFF" : "#000"
        }
    }

    Button{
        anchors.left:  parent.left
        anchors.bottom: parent.bottom
        text: "Dropdown button"
        onClicked: dropDown4.toggle()

        QTypes.DropDown {
            id: dropDown4

            MenuItem {
                text: "New..."
            }
            MenuItem {
                text: "Open..."
            }
            MenuItem {
                text: "Save"
            }
        }


        LayoutMirroring.enabled: true
        QTypes.Icon {
            name: parent.checked ? "expand_less" : "expand_more"
            color: parent.checked ? "#FFF" : "#000"
        }
    }
}

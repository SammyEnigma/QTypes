import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0

import "qrc:/QTypes" as QTypes

ApplicationWindow {
    id: window
    width: 360
    height: 520
    visible: true
    title: "QTypes"

    header: ToolBar {
        Material.foreground: "white"

        ToolButton {
            QTypes.Icon {  name: stackView.depth > 1 ? "chevron_left" : "menu" }

            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                    listView.currentIndex = -1
                } else
                    drawer.open()
            }
        }

        Label {
            anchors.centerIn: parent
            text: listView.currentItem ? listModelMenu.get(listView.currentIndex).title : ""
        }
    }

    Drawer {
        id: drawer
        width: Math.max(window.width * 0.7 , 300)
        height: window.height

        ListView {
            id: listView
            focus: true
            currentIndex: -1
            anchors.fill: parent
            anchors.topMargin: 20
            delegate: ItemDelegate {
                id: itemDelegate
                width: parent.width
                onClicked: openPage("Simple")

                function openPage(type) {
                    listView.currentIndex = index
                    stackView.push("qrc:/Examples/" + model.title + "/" + type + ".qml")
                    drawer.close()
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 25

                    RowLayout {
                        Layout.leftMargin: 10
                        Layout.minimumWidth: 120
                        spacing: 10

                        QTypes.Icon {
                            name: model.icon
                            color: Material.primary
                            side: 20
                        }

                        Label {
                            text: model.title
                            font.pixelSize: 12
                        }
                    }

                    Label {
                        text:qsTr("Simple")
                        font.pixelSize: 12
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Advanced")
                        font.pixelSize: 12
                        font.bold: true

                        MouseArea {
                            anchors.fill: parent
                            onClicked: itemDelegate.openPage("Advanced")
                        }
                    }
                }
            }

            model: listModelMenu

            ListModel {
                id: listModelMenu
                ListElement { title: qsTr("SearchModel");     icon: "search" }
                ListElement { title: qsTr("Accordion");       icon: "view_day" }
                ListElement { title: qsTr("Badge");           icon: "fiber_new" }
                ListElement { title: qsTr("DropDown");        icon: "arrow_drop_down_circle" }
                ListElement { title: qsTr("ImageLoader");     icon: "rotate_right" }
                ListElement { title: qsTr("Icon");            icon: "crop_original" }
                ListElement { title: qsTr("CalendarRange");   icon: "calendar" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        anchors.margins: 10
        initialItem: Pane {

            Row {
                visible: false
                anchors.centerIn: parent

                QTypes.Icon {
                    name: "view_quilt"
                    color: Material.primary
                    side: logo.implicitHeight
                }

                Label {
                    id: logo
                    font.pixelSize: 40
                    font.bold: true
                    leftPadding: 1
                    elide: Label.ElideRight
                    color: Material.primary
                    text: "QTypes"
                }
            }
        }
    }
}

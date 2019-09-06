import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0


// ###########################################
// [1][ADD] - import QtQmlPlugins
import "qrc:/QTypes" as QTypes
// [END] #####################################

Item {

    Column {
        anchors.centerIn: parent
        Layout.fillWidth: true
        spacing: 40

        // ###########################################
        // [2][ADD] - Icon

        Row {
            spacing: 10

            Button  {
                text: "My Button"
                display: AbstractButton.TextBesideIcon
                LayoutMirroring.enabled: true

                QTypes.Icon {
                    name: "arrow_right"
                }
            }

            Rectangle {
                width: 40
                height: 40
                radius: 8
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "red" }
                    GradientStop { position: 1.0; color: "orange" }
                }
                QTypes.Icon {
                    anchors.centerIn: parent
                    side: 24
                    name: "home_work"
                    color: "#fff"
                }
            }

            Rectangle {
                width: 40
                height: 40
                color: "#000"
                QTypes.Icon {
                    anchors.centerIn: parent
                    side: 22
                    name: "polymer"
                    color: "#fff"
                }
            }

            Rectangle {
                width: 40
                height: 40
                radius: 20
                color: "#000"
                QTypes.Icon {
                    anchors.centerIn: parent
                    side: 22
                    name: "navigation"
                    color: "#fff"
                    RotationAnimator on rotation {
                        from: 0;
                        to: 360;
                        duration: 1000
                        loops: -1
                    }
                }
            }
        }

        Grid {
            Layout.alignment: Qt.AlignHCenter
            columns: 6
            spacing: 20

            Repeater {
                model: [
                    "apps"
                    ,"arrow_back"
                    ,"arrow_back_ios"
                    ,"arrow_downward"
                    ,"arrow_drop_down"
                    ,"arrow_drop_down_circle"
                    ,"arrow_drop_up"
                    ,"arrow_forward"
                    ,"arrow_forward_ios"
                    ,"arrow_left"
                    ,"arrow_right"
                    ,"arrow_upward"
                    ,"cancel"
                    ,"check"
                    ,"chevron_left"
                    ,"chevron_right"
                    ,"close"
                    ,"double_arrow"
                    ,"expand_less"
                    ,"expand_more"
                    ,"first_page"
                    ,"fullscreen"
                    ,"fullscreen_exit"
                    ,"home_work"
                    ,"last_page"
                    ,"menu"
                    ,"menu_open"
                    ,"more_horiz"
                    ,"more_vert"
                    ,"refresh"
                    ,"subdirectory_arrow_left"
                    ,"subdirectory_arrow_right"
                    ,"unfold_less"
                    ,"unfold_more"]

                QTypes.Icon {
                    side: 22
                    name: modelData
                }
            }
        }
    }
}

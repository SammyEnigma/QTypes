import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

/*!
    \qmltype Badge
    \brief This type is a small content and labeling component.

    For example:
    \qml
    Badge {
        text: "My Text"
    }
    \endqml

    \sa Rectangle
*/

Rectangle {
    id: root
    smooth: true

    radius: height / (pill ? 2 : 6)

    implicitWidth: row.implicitWidth + row.implicitHeight
    implicitHeight: row.implicitHeight + row.implicitHeight

    color: Material.primary

    // [properties] ----------------------------------------------

    /*!
          \qmlproperty array Badge::version
          string with version
      */
    readonly property string version: "1.0.0"

    /*!
          \qmlproperty array Badge::name
          string with name of this type
      */
    readonly property string name: "Badge"

    /*!
        \qmlproperty alias Badge::label
        Alias to Component Label
    */
    property alias label: label

    /*!
        \qmlproperty alias Badge::light
        Alias to Component Badge light
    */
    property alias light: light

    /*!
        \qmlproperty alias Badge::lightlabel
        Alias to Component Badge light Label
    */
    property alias lightLabel: lightLabel

    /*!
        \qmlproperty bool Badge::pill
        bool set Pill badges more rounded (default false)
    */
    property bool pill: false

    Row {
        id: row
        anchors.centerIn: root
        spacing: light.visible ? light.height * 0.5 : 0

        Label {
            id: label
            color: Material.foreground
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: light
            visible: lightLabel.text
            radius: height / (pill ? 2 : 4)
            anchors.verticalCenter: parent.verticalCenter
            implicitWidth: lightLabel.implicitWidth + implicitHeight * 0.5
            implicitHeight: lightLabel.implicitHeight
            color: label.color

            Label {
                id: lightLabel
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: label.font.pixelSize * 0.7
                font.bold: true
                color: root.color
            }
        }
    }

    states: [
        State {
            name: "primary"
            PropertyChanges {
                target: root
                color: Material.color(Material.LightBlue)
                label.color: "#fff"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        },
        State {
            name: "secondary"
            PropertyChanges {
                target: root
                color: Material.color(Material.Grey)
                label.color: "#fff"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        },
        State {
            name: "success"
            PropertyChanges {
                target: root
                color: Material.color(Material.LightGreen)
                label.color: "#fff"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        },
        State {
            name: "danger"
            PropertyChanges {
                target: root
                color: Material.color(Material.Red)
                label.color: "#fff"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        },
        State {
            name: "warning"
            PropertyChanges {
                target: root
                color: Material.color(Material.Amber)
                label.color: "#fff"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        },
        State {
            name: "info"
            PropertyChanges {
                target: root
                color: Material.color(Material.Teal)
                label.color: "#fff"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        },
        State {
            name: "light"
            PropertyChanges {
                target: root
                color: "#eee"
                label.color: "#000"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        },
        State {
            name: "dark"
            PropertyChanges {
                target: root
                color: "#000"
                label.color: "#fff"
                light.color: "#fff"
                lightLabel.color: "#000"
            }
        }
    ]
}


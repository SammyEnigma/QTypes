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
        \qmlproperty alias Badge::counter
        Alias to Component Badge counter
    */
    property alias counter: counter

    /*!
        \qmlproperty alias Badge::counterLabel
        Alias to Component Badge counter Label
    */
    property alias counterLabel: counterLabel

    /*!
        \qmlproperty bool Badge::pill
        bool set Pill badges more rounded (default false)
    */
    property bool pill: false

    /*!
        \qmlproperty alias Badge::text
        direct alias to property text in label
    */
    property alias text: label.text

    /*!
        \qmlproperty alias Badge::counterText
        direct alias to property text in counter label
    */
    property alias counterText: counterLabel.text

    Row {
        id: row
        anchors.centerIn: root
        spacing: counter.visible ? counter.height * 0.5 : 0

        Label {
            id: label
            color: Material.foreground
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: counter
            visible: counterLabel.text
            radius: height / (pill ? 2 : 4)
            anchors.verticalCenter: parent.verticalCenter
            implicitWidth: counterLabel.implicitWidth + implicitHeight * 0.5
            implicitHeight: counterLabel.implicitHeight
            color: label.color

            Label {
                id: counterLabel
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font {
                    pixelSize: label.font.pixelSize * 0.7
                    bold: true
                }
                color: root.color
            }
        }
    }

    states: [
        State {
            name: "primary"
            PropertyChanges {
                target: root
                color: Material.color(Material.counterBlue)
                label.color: "#fff"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        },
        State {
            name: "secondary"
            PropertyChanges {
                target: root
                color: Material.color(Material.Grey)
                label.color: "#fff"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        },
        State {
            name: "success"
            PropertyChanges {
                target: root
                color: Material.color(Material.counterGreen)
                label.color: "#fff"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        },
        State {
            name: "danger"
            PropertyChanges {
                target: root
                color: Material.color(Material.Red)
                label.color: "#fff"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        },
        State {
            name: "warning"
            PropertyChanges {
                target: root
                color: Material.color(Material.Amber)
                label.color: "#fff"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        },
        State {
            name: "info"
            PropertyChanges {
                target: root
                color: Material.color(Material.Teal)
                label.color: "#fff"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        },
        State {
            name: "counter"
            PropertyChanges {
                target: root
                color: "#eee"
                label.color: "#000"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        },
        State {
            name: "dark"
            PropertyChanges {
                target: root
                color: "#000"
                label.color: "#fff"
                counter.color: "#fff"
                counterLabel.color: "#000"
            }
        }
    ]
}


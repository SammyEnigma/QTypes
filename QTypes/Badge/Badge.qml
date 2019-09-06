import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import "qrc:/QTypes" as QTypes

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

Control {
    id: root
    smooth: true
    implicitWidth: contentItem.implicitWidth + contentItem.implicitHeight
    implicitHeight: contentItem.implicitHeight + contentItem.implicitHeight
    padding: contentItem.implicitHeight * 0.5

    background: Rectangle {
        color: __private.color
        radius: root.radius
    }

    // [properties] ----------------------------------------------

    /*!
          \qmlproperty array Badge::version
          string with version
      */
    readonly property string version: "1.0.0"

    /*!
          \qmlproperty color Badge::color
           The color of the Badge background (default Material.primary)
      */
    property alias color: __private.color

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
    property string counterText

    /*!
        \qmlproperty alias Badge::icon
        alias to Component type QTypes.Icon
    */
    property alias icon: icon

    /*!
        \qmlproperty Component Badge::radius
        set Badge radius
    */
    property real radius: height / (pill ? 2 : 6)

    contentItem: RowLayout {
        id: row
        spacing: counter.visible || icon.visible ? label.height * 0.2 : 0
        LayoutMirroring.enabled: root.LayoutMirroring.enabled
        Layout.alignment: Qt.AlignHCenter

        Label {
            id: label
            color: __private.labelColor
            Layout.alignment: Qt.AlignVCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: counter
            visible: counterLabel.text.length > 0
            radius: height / (pill ? 2 : 4)
            Layout.alignment: Qt.AlignVCenter
            implicitWidth: counterLabel.implicitWidth + implicitHeight * 0.5
            implicitHeight: label.implicitHeight
            color: __private.labelColor

            property alias label: counterLabel

            Label {
                id: counterLabel
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font {
                    pixelSize: label.font.pixelSize * 0.7
                    bold: true
                }
                color: __private.color
                text: counterText
            }
        }

        QTypes.Icon {
            id: icon
            Layout.alignment: Qt.AlignVCenter
            visible: name.length > 0
            side: label.height * 1.2
        }
    }

    states: [
        State {
            name: "primary"
            PropertyChanges {
                target: __private
                color: Material.color(Material.LightBlue)
                labelColor: "#fff"
                counterColor: "#fff"
                counterLabelColor: "#000"
            }
        },
        State {
            name: "secondary"
            PropertyChanges {
                target: __private
                color: Material.color(Material.Grey)
                labelColor: "#fff"
                counterColor: "#fff"
                counterLabelColor: "#000"
            }
        },
        State {
            name: "success"
            PropertyChanges {
                target: __private
                labelColor: "#fff"
                counterColor: "#fff"
                counterLabelColor: "#000"
                color: Material.color(Material.LightGreen)
            }
        },
        State {
            name: "danger"
            PropertyChanges {
                target: __private
                labelColor: "#fff"
                counterColor: "#fff"
                counterLabelColor: "#000"
                color: Material.color(Material.Red)
            }
        },
        State {
            name: "warning"
            PropertyChanges {
                target: __private
                labelColor: "#fff"
                counterColor: "#fff"
                counterLabelColor: "#000"
                color: Material.color(Material.Amber)
            }
        },
        State {
            name: "info"
            PropertyChanges {
                target: __private
                labelColor: "#fff"
                counterColor: "#fff"
                counterLabelColor: "#000"
                color: Material.color(Material.Teal)
            }
        },
        State {
            name: "light"
            PropertyChanges {
                target: __private
                labelColor: "#000"
                counterColor: "#fff"
                counterLabelColor: "#000"
                color: "#eee"
            }
        },
        State {
            name: "dark"
            PropertyChanges {
                target: __private
                labelColor: "#fff"
                counterColor: "#fff"
                counterLabelColor: "#000"
                color: "#000"
            }
        }
    ]

    // [private] -------------------------------

    QtObject {
        id: __private

        property color color: Material.primary
        property color labelColor: Material.foreground
        property color counterColor: Material.foreground
        property color counterLabelColor: Material.primary
    }
}


import QtQuick 2.0
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.5

import "qrc:/QTypes" as QTypes

/*!
    \qmltype Icon
    \brief This type display Material icons

    For example:
    \qml
    QTypes.Icon {
        name: "clear"
    }
    \endqml

    \sa Item
*/

Item {
    id: root
    width: side
    height: side

    /*!
          \qmlproperty array Icon::version
          string with version
      */
    readonly property string version: "1.0.0"

    /*!
          \qmlproperty real Icon::side
          This property holds square side
      */
    property real side

    /*!
        \qmlproperty color Icon::color
        The color of the icon (default "#000")
    */
    default property color color: "#000"

    /*!
        \qmlproperty string Icon::name
        This property holds the name of the icon to use.
        The icon will be loaded from the title of icon.
        If the icon is not found, show only a square.
        For more information on Material icons, got to https://www.material.io/resources/icons/
    */
    property string name

    onNameChanged: __private.updateIcon()
    onSideChanged: __private.updateSide()

    Component.onCompleted: {
        __private.updateSide()
        __private.updateIcon()
    }

    Loader {
        id: loader
        anchors.fill: parent
    }

    // [private] -------------------------------

    QtObject {
        id: __private

        property string file: "qrc:/Icon/png/" + (side > 24 ? "48" : "24") + "/" + name +".png"

        function updateSide() {
            if (side == 0)
                side = Math.max(Math.min(root.parent.width, root.parent.height), 16)
        }

        function updateIcon() {
            if (root.parent && name.length > 0 && side > 0)
            {
                if (root.parent instanceof AbstractButton) {
                    root.parent.icon.source = ""
                    root.parent.icon.source = __private.file
                    root.parent.icon.color = root.color
                } else {
                    loader.sourceComponent  = undefined
                    loader.sourceComponent = maskIconComponent
                }
            }
        }


        property Component maskIconComponent: Item {
            Rectangle {
                id: iconColor
                anchors.fill: parent
                smooth: true
                visible: false
                color: root.color
            }

            Image {
                id: maskIcon
                source: __private.file
                anchors.fill: parent
                smooth: true
                visible: false
            }

            OpacityMask {
                anchors.fill: iconColor
                source: iconColor
                maskSource: maskIcon
            }
        }
    }
}

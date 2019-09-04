import QtQuick 2.12
import QtQuick.Controls 2.12

/*!
    \qmltype JumpTo
    \brief

    For example:
    \qml
    \endqml

    \sa
*/

Item {
    id: root

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
    readonly property string name: "JumpTo"


    property variant target

    Connections {
        target: root.parent
        onClicked: console.log("ok")
    }
}


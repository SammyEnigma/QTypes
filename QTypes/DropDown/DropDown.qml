import QtQuick 2.0
import QtQuick.Controls 2.5

/*!
    \qmltype DropDown
    \brief This type are toggleable, contextual for displaying lists of MenuItems.

    For example:
    \qml
    Button{
        onClicked: dropDown.toggle()

        QTypes.DropDown {
            id: dropDown

            MenuItem {
                text: "New..."
            }
        }
    }

    \endqml

    \sa Menu
*/

Menu {
    id: root
    closePolicy: Popup.CloseOnReleaseOutsideParent

    // [properties] ----------------------------------------------

    /*!
          \qmlproperty array DropDown::version
          string with version
      */
    readonly property string version: "1.0.0"

    /*!
          \qmlproperty array DropDown::name
          string with name of this type
      */
    readonly property string name: "Badge"

    // [signals] ------------------------------------
    /*!
          \qmlsignal DropDown::toggle()
          toggle the dropDown open or close the DropDown
      */
    signal toggle();


    onToggle: {
        if (opened)
            close()
        else
            open()
    }

    onClosed: _private.toggle()
    onOpened: _private.toggle()

    QtObject {
        id: _private

        function rootObject(obj) {
            return obj.parent ? rootObject(obj.parent) : obj
        }

        function changeChecked(status) {
            if (typeof root.parent.checked !== "undefined")
                root.parent.checked = status
        }

        function toggle() {

            if (root.opened) {
                root.y = root.parent.height
                root.x = 0

                if (root.y != root.parent.height)
                    root.y = -root.height

                if (root.x != 0)
                    root.x = -(root.width-root.parent.width)
            }

            changeChecked(root.opened)
        }
    }
}

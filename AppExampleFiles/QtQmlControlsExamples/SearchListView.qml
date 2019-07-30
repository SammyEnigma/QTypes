import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

// [1][ADD] - import QtQmlControls
import "qrc:/QtQmlControls" as QtQmlControls

ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true


        // [2][ADD] - SearchListView Control
        QtQmlControls.SearchListView {
            id: searchListView
            Layout.fillWidth: true


            listView: list                       // ListView id
            caseSensitive: false                 // caseSensitive search (optional)
            ignoreProperties: ["propertyIgnore"] // Array with properties to ignore in listView.model  (optional)
        }

        Button {
            onClicked: searchListView.reset()
            text: qsTr("Reset")
        }
    }

    ListView {
        id: list
        delegate: ItemDelegate {
            width: parent.width
            text: model.text
            highlighted: ListView.isCurrentItem
        }
        model: ListModel {
            ListElement { text: "Text A"; value: "1"; propertyIgnore: "some value 1 to ignore" }
            ListElement { text: "Text B"; value: "2"; propertyIgnore: "some value 2 to ignore" }
            ListElement { text: "Text C"; value: "3"; propertyIgnore: "some value 3 to ignore" }
            ListElement { text: "Text D"; value: "4"; propertyIgnore: "some value 4 to ignore" }
            ListElement { text: "Text E"; value: "5"; propertyIgnore: "some value 5 to ignore" }
            ListElement { text: "Text F"; value: "6"; propertyIgnore: "some value 6 to ignore" }
        }

        Layout.fillWidth: true
        Layout.fillHeight: true
    }
}

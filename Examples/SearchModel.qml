import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.XmlListModel 2.0


// ###########################################
// [1][ADD] - import QtQmlControls
import "qrc:/QtQmlControls" as QtQmlControls
// [END] #####################################

ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true


        // ###########################################
        // [2][ADD] - SearchModel Control
        QtQmlControls.SearchModel {
            id: searchModel
            Layout.fillWidth: true
            placeholderText: qsTr("Search")

            // SearchModel Properties
            list: list                    // ListView id
            caseSensitive: false                 // caseSensitive search (optional)
            ignoreProperties: ["propertyIgnore"] // Array with properties to ignore in listView.model  (optional)
        }
        // [END] #####################################

        // (Optional) reset set initial model data
        Button {
            onClicked: searchModel.reset()
            text: qsTr("Reset")
        }
    }

    ListView {
        id: list
        delegate: Text {
            width: parent.width
            id: name
            text: typeof modelData !== "undefined" ? modelData.text : model.text
        }

        model: ListModel {
            ListElement { text: "Text A"; value: "1"; number: 1; propertyIgnore: "some value 1 to ignore" }
            ListElement { text: "Text B"; value: "2"; number: 2; propertyIgnore: "some value 2 to ignore" }
            ListElement { text: "Text C"; value: "3"; number: 3; propertyIgnore: "some value 3 to ignore" }
            ListElement { text: "Text D"; value: "4"; number: 4; propertyIgnore: "some value 4 to ignore" }
            ListElement { text: "Text E"; value: "5"; number: 5; propertyIgnore: "some value 5 to ignore" }
            ListElement { text: "Text F"; value: "6"; number: 6; propertyIgnore: "some value 6 to ignore" }
        }

        // Other models types supported
        //
        //        ObjectModel {
        //            Text { text: "Text A"; height: 30; width: 80;  }
        //            Text { text: "Text B"; height: 30; width: 80;  }
        //            Text { text: "Text C"; height: 30; width: 80;  }
        //            Text { text: "Text D"; height: 30; width: 80;  }
        //        }
        //
        //        [{text:"Text A", value: "1"}, {text:"Text B", value: 2  }, {text: 12345  , value: "3"}]

        Layout.fillWidth: true
        Layout.fillHeight: true
    }
}

/*!
    \qmltype SearchListView
    \inqmlmodule QtQmlControls
    \since 5.2
    \brief This type is a simple search in model of ListView.
    It can possible search in array of objects or in ListModel.
    For example:
    \qml
    SearchListView {
        listView: myListView
    }
    ListView {
        id: myListView
        delegate: ItemDelegate {
            width: parent.width
            text: model.text
            highlighted: ListView.isCurrentItem
        }
        model: ListModel {
            ListElement { text: "Text 1"; value: "1" }
        }
    }
    \endqml

    \sa TextArea
*/

import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.12

TextField {
    id: root

    // default TextArea properties
    placeholderText: qsTr("Search")


    // [properties] ----------------------------------------------
    /*!
        \qmlproperty ListView SearchListView::listView
        Pointer to ListView
    */
    property ListView listView

    /*!
        \qmlproperty array  SearchListView::ignoreProperties
        List of ignore Keys in search
    */
    property var ignoreProperties: []

    /*!
        \qmlproperty int
        Min search text length
    */
    property int minSearchLength: 1

    /*!
        \qmlproperty bool
        Search case sensitive
    */
    property bool caseSensitive: true


    // [properties] readonly ------------------------------------
    /*!
          \qmlproperty array SearchListView::keys
          array with a found keys if model not empty
      */
    readonly property alias keys: attributes.keys

    /*!
          \qmlproperty array SearchListView::results
          array with a found results
      */
    readonly property alias results: attributes.results


    // [Actions] ----------------------------------------------

    onFocusChanged: {
        if (focus && text.length === 0) {
            attributes.clear()
            attributes.update()
        }
    }

    onTextChanged: {

        if (!focus || attributes.keys.length <= 0 || attributes.modelBackupTotal <= 0)
            return

        if (text.length === 0) {
            listView.model = attributes.modelBackup
            return
        }

        let modelTmp = attributes.createNewList()
        if (attributes.modelType === 2) {
            if (attributes.results) {
                attributes.results.clear()
                modelTmp = attributes.results
            } else
                modelTmp = Qt.createQmlObject('import QtQuick 2.2; ListModel {}', root)
        }

        for (var i = 0; i < attributes.modelBackupTotal; ++i)
            for (var j = 0; j < attributes.keys.length; ++j)
                if (attributes.modelType === 1)
                {
                    if (attributes.compareField(attributes.modelBackup[i][attributes.keys[j]], text))
                        modelTmp.push(attributes.modelBackup[i])

                } else if (attributes.modelType === 2)
                    if (attributes.compareField(attributes.modelBackup.get(i)[attributes.keys[j]], text))
                        modelTmp.append(attributes.modelBackup.get(i))

        attributes.results = modelTmp
        attributes.resultsTotal = attributes.getTotal(attributes.results)
        listView.model = attributes.results
    }


    /*!
           \qmlmethod TextArea::reset()
           reset the search and set default values
    */

    function reset() {
        if (text.length > 0) {
            focus = false
            listView.model = attributes.copy()
            attributes.clear()
            text = ""
        }
    }



    // [private] type attributes -------------------------------
    QtObject {
        id: attributes
        property variant modelBackup: null
        property int modelBackupTotal: 0
        property int modelType: 0 // 0 none | 1 - ObjectModel | 2 - ListModel | 3 - XmlListModel [TODO]
        property variant results: null
        property int resultsTotal: 0
        property variant keys: []

        function update() {
            if(getModelType()) {
                modelBackupTotal = getTotal(listView.model)
                if (modelBackupTotal > 0) {
                    getKeys()
                    modelBackup = listView.model
                }
            }
        }

        function getModelType() {
            if (typeof listView.model.length !== "undefined")
                modelType = 1
            else if (typeof listView.model.count !== "undefined" && typeof listView.model.xml === "undefined")
                modelType = 2

            return modelType === 1 || modelType === 2;
        }

        function getTotal (model) {
            return modelType === 1 ? model.length : model.count
        }

        function getKeys() {
            if (modelBackupTotal > 0) {
                let tmp = modelType === 1 ? listView.model[0] : listView.model.get(0)
                if (typeof listView.model.length !== "object")
                    keys = Object.keys(tmp).filter(value => !ignoreProperties.includes(value))
            }
        }

        function clear() {
            if (modelType != 0)
                results = null

            modelBackup = null
            keys = []
            modelType = 0
            modelBackupTotal = 0
            resultsTotal = 0
        }

        function compareField(field, text) {
            if (caseSensitive)
                return field.includes(text)

            return field.toLowerCase().includes(text.toLowerCase())
        }

        function createNewList() {
            if (modelType === 2) {
                if (results) {
                    results.clear()
                    return results
                } else
                    return Qt.createQmlObject('import QtQuick 2.2; ListModel {}', root)
            }
            return [];
        }

        function copy() {
            if (modelType === 2) {
                let model = Qt.createQmlObject('import QtQuick 2.2; ListModel {}', listView)
                for (var i = 0; i < attributes.modelBackup.count; ++i)
                    model.append(attributes.modelBackup.get(i))
                return model
            }
            return attributes.modelBackup;
        }
    }
}


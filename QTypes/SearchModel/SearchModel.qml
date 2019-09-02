import QtQuick 2.0
import QtQuick 2.12
import QtQml.Models 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.12

/*!
    \qmltype SearchModel
    \brief This type is a simple search in data models.
    It can possible search in Data Models: ListModel or ObjectModel, or provided
    by C++ model classes If a C++ model class is used, it must be a subclass of
    QAbstractItemModel or a simple list.
    Interact with QML Types ListView, Repeater, TableView and GridView

    For example:
    \qml
    SearchModel {
        model: myListView.model
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

    \sa TextInput
*/

TextField {
    id: root

    /*!
          \qmlproperty array SearchModel::version
          string with version
      */
    readonly property string version: "1.0.0"

    /*!
          \qmlproperty array SearchModel::name
          string with name of this type
      */
    readonly property string name: "SearchModel"


    // [properties] ----------------------------------------------
    /*!
        \qmlproperty variant SearchModel::list
        Pointer to target
    */
    property variant list

    /*!
        \qmlproperty list<String> SearchModel::ignoreKeys
        List of ignore Keys in search
    */
    property variant ignoreKeys: []

    /*!
        \qmlproperty int SearchModel::minSearchLength
        Min search text length default 1
    */
    property int minSearchLength: 1

    /*!
        \qmlproperty bool SearchModel::caseSensitive
        Search case sensitive
    */
    property bool caseSensitive: false

    // [properties] readonly ------------------------------------


    // [signals] ------------------------------------
    /*!
          \qmlsignal SearchModel::results(variant results)
          list with a found results
      */
    signal results(variant list)

    // [methods] ------------------------------------
    /*!
           \qmlmethod SearchModel::reset()
           Reset the search and set default values
    */
    function reset() {
        if (text.length) {
            focus = false
            list.model = _private.modelBackup
            _private.clear()
            text = ""
        }
    }


    // [Actions] -----------------------------------------------

    onFocusChanged: {
        if (focus && text.length === 0) {
            _private.clear()
            _private.update()
        }
    }

    onTextChanged: {
        if (!focus  || _private.keys.length <= 0 || _private.modelBackupTotal <= 0)
            return

        if (text.length === 0 || text.length < minSearchLength)
            list.model = _private.modelBackup
        else if (minSearchLength <= text.length)
            _private.search()
    }

    // [private] ---------------------------------------------

    QtObject {
        id: _private
        property variant modelBackup
        property int modelBackupTotal: 0
        property int modelType: 0 // 0 none | 1 - list QML Basic Type | 2 - ObjectModel | 3 - ListModel
        property variant results: null
        property int resultsTotal: 0
        property variant keys: []

        function getModelType() {
            if (list.model.toString().indexOf("QQmlListModel") !== -1)
                modelType = 3
            else if (typeof list.model.length !== "undefined")
                modelType = 1
            else if (list.model.toString().indexOf("QQmlObjectModel") !== -1)
                modelType = 2

            return modelType > 0;
        }

        function getTotal (model) {
            return modelType > 1 ?  model.count : model.length
        }

        function getKeys() {
            const tmp = modelType > 1 ? list.model.get(0) : list.model[0]
            if (typeof list.model === "object")
            {
                if (modelType == 3 || modelType == 1)
                    keys = Object.keys(tmp).filter(value => !ignoreKeys.includes(value))
                else
                    keys = Object.keys(tmp).filter(value => !ignoreKeys.includes(value) && typeof tmp[value] === "string")
            }
        }

        function update() {
            if(getModelType()) {
                modelBackupTotal = getTotal(list.model)
                if (modelBackupTotal > 0) {
                    getKeys()
                    modelBackup = list.model
                }
            }
        }

        function clear() {
            if (modelType)
                results = null
            keys = []
            modelType = 0
            modelBackupTotal = 0
            resultsTotal = 0
        }

        function compareField(field, text)
        {
            if (typeof field === "number")
                field = field.toString()
            else if (typeof field !== "string")
                return false

            return caseSensitive ? field.includes(text) : field.toLowerCase().includes(text.toLowerCase())
        }

        function createNewList() {
            if (modelType > 1) {
                if (results) {
                    results.clear()
                    return results
                } else
                    return Qt.createQmlObject('import QtQuick 2.2; '+ ( modelType === 3 ? 'ListModel' : 'import QtQml.Models 2.12; ObjectModel') +' {}', root)
            }

            return [];
        }

        function search() {
            let modelTmp = createNewList()
            for (var i = 0; i < modelBackupTotal; ++i)
            {
                for (var j = 0; j < keys.length; ++j)
                {
                    if (modelType === 1)
                    {
                        if (compareField(modelBackup[i][keys[j]], text))
                        {
                            modelTmp.push(modelBackup[i])
                            break;
                        }
                    } else
                        if (compareField(modelBackup.get(i)[keys[j]], text))
                        {
                            modelTmp.append(modelBackup.get(i))
                            break;
                        }
                }
            }

            results = modelTmp
            resultsTotal = getTotal(results)
            list.model = results
            root.results(results)
        }
    }
}


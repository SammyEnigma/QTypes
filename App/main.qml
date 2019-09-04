import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0

ApplicationWindow {
    id: window
    width: 360
    height: 520
    visible: true
    title: "QTypes"

    header: ToolBar {
        Material.foreground: "white"

        ToolButton {
            icon.source: stackView.depth > 1 ? "qrc:/App/icons/back.png" : "qrc:/App/icons/drawer.png"
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                    listView.currentIndex = -1
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: listView.currentItem ? listView.currentItem.text : ""
            font.pixelSize: 20
            elide: Label.ElideRight
            anchors.centerIn: parent
            Layout.fillWidth: true
        }
    }

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        interactive: stackView.depth === 1

        ListView {
            id: listView
            focus: true
            currentIndex: -1
            anchors.fill: parent
            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                font.pixelSize: 12
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: qsTr("SearchModel");            source: "qrc:/Examples/SearchModel/Simple.qml" }
                ListElement { title: qsTr("SearchModel > Advanced"); source: "qrc:/Examples/SearchModel/Advanced.qml" }
                ListElement { title: qsTr("Accordion");              source: "qrc:/Examples/Accordion/Simple.qml" }
                ListElement { title: qsTr("Accordion > Advanced");   source: "qrc:/Examples/Accordion/Advanced.qml" }
                ListElement { title: qsTr("Badge");                  source: "qrc:/Examples/Badge/Simple.qml" }
                ListElement { title: qsTr("Badge > Advanced");       source: "qrc:/Examples/Badge/Advanced.qml" }
                ListElement { title: qsTr("DropDown");               source: "qrc:/Examples/DropDown/Simple.qml" }
                ListElement { title: qsTr("DropDown > Advanced");    source: "qrc:/Examples/DropDown/Advanced.qml" }
                ListElement { title: qsTr("ImageLoader");               source: "qrc:/Examples/ImageLoader/Simple.qml" }
                ListElement { title: qsTr("ImageLoader > Advanced");    source: "qrc:/Examples/ImageLoader/Advanced.qml" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        anchors.margins: 10
        initialItem: Pane {

            Label {
                anchors.centerIn: parent
                bottomPadding: 40
                font.pixelSize: 40
                font.bold: true
                leftPadding: 1
                elide: Label.ElideRight
                color: Material.primary
             //   text: "QTypes"
            }
        }
    }

    property variant graph: ({})
    property variant listHover: []

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onMouseXChanged: debuggerTarget.x = mouseX - 2
        onMouseYChanged: debuggerTarget.y = mouseY - 2
        propagateComposedEvents: true
        onClicked: {
            graph = {}

            var _root = rootObject(window)
            graph = graphMap(window.contentItem, 0)

            recursiveFind(graph);

            for (var i = 0; i < listHover.length; ++i) {
                console.log(listHover[i].obj + "--" +  listHover[i].level)
            }

            if (listHover.length > 0) {
                let id = listHover.length -1
                debuggerObjTarget.x = listHover[id].rect.ptl.x
                debuggerObjTarget.y = listHover[id].rect.ptl.y
                debuggerObjTarget.width = listHover[id].rect.pbr.x
                debuggerObjTarget.height = listHover[id].rect.pbr.y
                console.log(  listHover[id].rect.ptl + "--" +  listHover[id].rect.pbr)
            }
        }

        function recursiveFind(o) {
            if ( mouseX > o.rect.ptl.x
                 && mouseY > o.rect.ptl.y
                              && mouseX < o.rect.pbr.x
                              && mouseY < o.rect.pbr.y) {
                console.log(mouseX + "--" + mouseY + "---" + o.rect.ptl + "--" +  o.rect.pbr)
                         listHover.push(o)
            }

            if (o.children.length > 0)
                for (var i = 0; i < o.children.length; ++i)
                    recursiveFind(o.children[i])
        }
    }

    Rectangle {
        id: debuggerTarget
        width: 4
        height: 4
        color: "transparent"
        border.color: "#000"
        border.width: 1
        opacity: 0.5
    }

    Rectangle {
        id: debuggerObjTarget
        color: "transparent"
        border.color: "red"
        border.width: 1
        opacity: 0.5
    }
    function rootObject(obj) {
        return obj.parent ? rootObject(obj.parent) : obj
    }

    function graphMap(obj, level) {

        let _objJson = {
            obj: obj, 
            children: [],
            rect: {
                ptl: Qt.point(-1, -1),
                pbr: Qt.point(-1, -1),
            },
            level: parseInt(level)}
        let tmp

        for (var i = 0; i < obj.children.length; ++i) {
            let _obj = obj.children[i]
            if (typeof _obj.currentItem != "undefined") {

                if (_obj.currentItem) {

                    tmp = _obj.currentItem.mapToItem(null,0,0)

                    _objJson.rect = {
                        ptl: Qt.point(tmp.x, tmp.y),
                        pbr: Qt.point(tmp.x + _obj.currentItem.width, tmp.y + _obj.currentItem.height)
                    };

                    _objJson.children.push(graphMap(_obj.currentItem, (level + 1)))
                }

            } else if (_obj instanceof Item) {

                tmp = _obj.mapToItem(null,0,0)

                _objJson.rect = {
                    ptl: Qt.point(tmp.x, tmp.y),
                    pbr: Qt.point(tmp.x + _obj.width, tmp.y + _obj.height)
                }

                _objJson.children.push(graphMap(_obj, (level + 1)))
            }
        }
        return _objJson;
    }
}

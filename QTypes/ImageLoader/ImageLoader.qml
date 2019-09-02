import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.12

/*!
    \qmltype ImageLoader
    \brief This type is a simple status image wrapper.

    For example:
    \qml
        QTypes.ImageLoader {
            anchors.fill: parent
            source: "https://upload.wikimedia.org/wikipedia/commons/a/a0/%27Greeley_Panorama%27_from_Opportunity%27s_Fifth_Martian_Winter%2C_PIA15689.jpg"
        }
    \endqml

    \sa Image
*/

Image {
    id: root
    asynchronous: true

    /*!
          \qmlproperty array SearchModel::version
          string with version
      */
    readonly property string version: "1.0.0"

    /*!
          \qmlproperty array SearchModel::name
          string with name of this type
      */
    readonly property string name: "ImageLoader"


    // [properties] ----------------------------------------------

    /*!
        \qmlproperty url SearchModel::errorImageSource
        Error image source show when root status is error
    */
    property url errorImageSource: ""

    /*!
        \qmlproperty Component SearchModel::errorComponent
        Error Component show when root status is error
    */
    property Component errorComponent: __private.errorComponent

    /*!
        \qmlproperty color SearchModel::errorComponentColor
        Color Theme of Error Component (default Grey)
    */
    property color errorComponentColor: Material.color(Material.Grey)

    /*!
        \qmlproperty Component SearchModel::loadingComponent
        ProgressBar Component show the progress when loading
    */
    property Component loadingComponent: __private.loadingComponent

    /*!
        \qmlproperty bool SearchModel::loadingComponentProgress
        show the percentage of progress
    */
    property bool loadingComponentProgress: true

    /*!
        \qmlproperty color SearchModel::loadingComponentProgressColor
        Progress text color (default Grey)
    */
    property color loadingComponentProgressColor: Material.color(Material.Grey)


    onStatusChanged: {
        imageStatusLoader.sourceComponent = undefined

        if (root.status === Image.Loading)
            imageStatusLoader.sourceComponent = loadingComponent

        if (root.status === Image.Error)
            imageStatusLoader.sourceComponent = (errorImageSource != ""  ?  __private.errorImageSourceComponent : errorComponent)

    }

    Loader {
        id: imageStatusLoader
        anchors.centerIn: root
        anchors.fill: parent
    }

    // [private] -------------------------------

    QtObject {
        id: __private

        function checkSize() {
            if (!width && !height) {
                root.width = 100
                root.height = 100
            }
        }

        property Component loadingComponent: Item {
            ProgressBar {
                anchors.centerIn: parent
                width: parent.width * 0.9
                value: root.progress
                visible: root.status === Image.Loading

                Text {
                    visible: loadingComponentProgress
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.top
                    font.pixelSize: root.height * 0.2
                    color: loadingComponentProgressColor
                    text: parseInt(root.progress * 100) + "%"
                }
            }
            Component.onCompleted: __private.checkSize()
        }

        property Component errorComponent: Control {
            id: ctrl
            clip: true
            background: Rectangle{
                border {
                    color: errorComponentColor
                    width: ctrl.width * 0.05
                }
                radius: ctrl.width * 0.1
                color: "transparent"
            }
            contentItem: Item {
                Item {
                    anchors.centerIn: parent
                    width: ctrl.width * 0.8 - background.border.width
                    height: ctrl.height * 0.8 - background.border.width
                    clip: true

                    Item {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width * 0.4
                        height: parent.height * 0.4

                        Repeater {
                            model: 2
                            Rectangle {
                                width:  background.border.width
                                height: parent.height
                                color: errorComponentColor
                                rotation: index == 0 ? -45 : 45
                                anchors.centerIn: parent
                            }
                        }
                    }

                    Rectangle {
                        width: ctrl.width * 0.3
                        height: width
                        color: errorComponentColor
                        rotation: 45
                        anchors.verticalCenter: parent.bottom
                    }

                    Rectangle {
                        width: ctrl.width * 0.5
                        height: width
                        color: errorComponentColor
                        rotation: -45
                        anchors.verticalCenter: parent.bottom
                        anchors.right: parent.right
                    }
                }
            }
            Component.onCompleted: __private.checkSize()
        }

        property Component errorImageSourceComponent: Item {
            Image {
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                width: parent.width < implicitWidth ? parent.width : implicitWidth
                source: errorImageSource
            }
            Component.onCompleted: __private.checkSize()
        }
    }
}

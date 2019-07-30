# QtQmlControls
Qt Qml Controls

Installation
=====

Copy folder QtQmlControls/ to root of your project

Pro file Dependencies

```
    QT += quickcontrols2
    RESOURCES += QtQmlControls/qtqmlcontrols.qrc


Exemple qml import

```
    import QtQuick 2.12
    import QtQuick.Controls 2.12

    import "qrc:/QtQmlControls" as QtQmlControls

    Item {
        QtQmlControls.SearchListView {
        }
    }

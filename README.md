# QtQmlControls
QtQmlControls is a set of Object Types through QML.
Is a easily way import a libary of Types in your own QML, provides many visual
components and features to manipulate data.


# Getting started

## Qt version
requires Qt 5.12 or highter

## Object Types
 - [SearchModel](https://github.com/RicGuerra/QtQmlControls/blob/master/Examples/SearchModel.qml) - Search in Data Models
 

Installation
=====

Copy the folder QtQmlControls/ to root of your project

Pro file Dependencies
```c#
    QT += quickcontrols2
    RESOURCES += QtQmlControls/qtqmlcontrols.qrc
```

Example qml implementation
```js
    import QtQuick 2.12
    import QtQuick.Controls 2.12

    import "qrc:/QtQmlControls" as QtQmlControls

    Item {
        QtQmlControls.SearchModel {
        }
    }
```

# Examples
Checkout the [examples](https://github.com/RicGuerra/QtQmlControls/blob/master/Examples/)

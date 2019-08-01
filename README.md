# QtQmlControls
QtQmlControls is set of Object Types through QML.
Is a easily way import a libary of Types in your own QML, provides many visual
components and features to manipulate data.


# Documentation

https://

# Getting started

## Qt version
requires Qt 5.12 or highter

Installation
=====

Copy folder QtQmlControls/ to root of your project

Pro file Dependencies

```c++
    QT += quickcontrols2
    RESOURCES += QtQmlControls/qtqmlcontrols.qrc


Exemple qml import

```js
    import QtQuick 2.12
    import QtQuick.Controls 2.12

    import "qrc:/QtQmlControls" as QtQmlControls

    Item {
        QtQmlControls.SearchModel {
        }
    }


# Examples
Checkout the [examples](https://github.com/QtQmlControls/examples)

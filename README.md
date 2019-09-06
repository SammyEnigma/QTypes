# QTypes
### Introduction
QType is a set of Object Types through QML.
Is a easily way import a libary of Types in your own QML, provides many visual
components and features to manipulate data.

# Getting started

## Qt version
Requires Qt 5.12 or highter

## Object Types

| Type   | Description |
| ------ | ------ |
| [Accordion](https://github.com/RicGuerra/QTypes/tree/master/QTypes/Accordion)            | Displays collapsible content panels in a limited space.
| [Badges](https://github.com/RicGuerra/QTypes/tree/master/QTypes/Badge)                   | Small text container.
| [DropDown](https://github.com/RicGuerra/QTypes/tree/master/QTypes/DropDown)              | Toggleable, contextual Menu.
| [ImageLoader](https://github.com/RicGuerra/QTypes/tree/master/QTypes/ImageLoader)        | Visual status Image Loader.
| [Icon](https://github.com/RicGuerra/QTypes/tree/master/QTypes/Icon)                      | Material Icons.
| [SearchModel](https://github.com/RicGuerra/QTypes/tree/master/QTypes/SearchModel)        | Simple search in data models.


Quick start
=====

 - Copy the folder QTypes/ to root of your project
 - Pro file Dependencies:
```c#
    QT += quickcontrols2
    RESOURCES += QTypes/QTypes.qrc
```

## Qml Implementation

Accordion example:

```js
    import "qrc:/QTypes" as QTypes

    Item {
        QTypes.Accordion {
            model: ListModel {
                  ListElement { title: "My title 1"; content: "Text content 1" }
                  ListElement { title: "My title 2"; content: "Text content 2" }
            }
        }
    }
```


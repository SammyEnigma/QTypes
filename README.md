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
| [Accordion](https://github.com/RicGuerra/QTypes/tree/master/Examples/Accordion)            | Displays collapsible content panels in a limited space.
| [Badges](https://github.com/RicGuerra/QTypes/tree/master/Examples/Badge)                   | Small text container.
| [SearchModel](https://github.com/RicGuerra/QTypes/tree/master/Examples/SearchModel)        | Search in Data Models.


Quick start
=====

 - Copy the folder QTypes/ to root of your project
 - Pro file Dependencies:
```c#
    QT += quickcontrols2
    RESOURCES += QTypes/QTypes.qrc
```

Implementation
=====

QML Accordion example:

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


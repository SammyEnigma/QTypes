# DropDown

This type are toggleable, contextual for displaying lists
of [MenuItems](https://doc.qt.io/qt-5/qml-qtquick-controls2-menuitem.html).

**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.12 or highter

**Inherits**: Menu

## Example

```js
    import "qrc:/QTypes" as QTypes

    Item {
        Button{
            text: "My Button"
            onClicked: dropDown.toggle()

            QTypes.DropDown {
                id: dropDown

                MenuItem {
                    text: "New..."
                }
                MenuItem {
                    text: "Open..."
                }
            }
        }
    }
```

| Example   | Description |
| ------ | ------ |
| [Simple](https://github.com/RicGuerra/QTypes/tree/master/Examples/DropDown/Simple.qml)           | Basic implementation
| [Advanced](https://github.com/RicGuerra/QTypes/tree/master/Examples/DropDown/Advanced.qml)       | DropDown Button

----

## Signals

### toggle()

Toggle the dropDown open or close the DropDown

----

### Including inherited
 [Menu QML Type](https://doc.qt.io/qt-5/qml-qtquick-controls2-menu.html)

----

# DropDown

This type are toggleable, contextual for displaying lists
of MenuItems.

**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.7 or highter

**Inherited By**: Menu

## Example

```js
    import "qrc:/QTypes" as QTypes

    Item {
        Button{
            onClicked: dropDown.toggle()

            QTypes.DropDown {
                id: dropDown

                MenuItem {
                    text: "New..."
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


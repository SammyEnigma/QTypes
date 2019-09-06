# Icon

This type display a Material icon image.
All icons available in [Material.io](https://www.material.io/resources/icons/).

**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.12 or highter

**Inherits**: Item

## Example

```js
    import "qrc:/QTypes" as QTypes

    Item {
        QTypes.Icon {
            name: "home_work"
        }
    }
```

#How to select icon
Go to [Material.io](https://www.material.io/resources/icons/) select the icon you want to use,
under the icon or in [Selected Icon] you find the icon name, copy this name and set in property name.

| Example   | Description |
| ------ | ------ |
| [Simple](https://github.com/RicGuerra/QTypes/tree/master/Examples/Icon/Simple.qml)           | Basic implementation
| [Advanced](https://github.com/RicGuerra/QTypes/tree/master/Examples/Icon/Advanced.qml)       | Icons, Buttons with icons

----

## Properties

### name: string

This property holds the name of the icon to use.
The icon will be loaded from the title of icon in Material.io.
If the icon name is not found, show only a square.
For more information on Material icons and find the name,
got to [Material.io](https://www.material.io/resources/icons/)

----

### color: color

The color of the icon (default "#000")

----

### side: real

This property holds side square of the icon

----

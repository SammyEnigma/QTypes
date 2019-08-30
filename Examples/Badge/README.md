# Badge

This type is a badges, our small count and labeling.


**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.7 or highter

**Inherited By**: Rectangle


## Examples

| Example   | Description |
| ------ | ------ |
| [Simple](https://github.com/RicGuerra/QTypes/tree/master/Examples/Badge/Simple.qml)             | Basic implementation.
| [Advanced](https://github.com/RicGuerra/QTypes/tree/master/Examples/Badge/Advanced.qml)         | Pill badge, Change colors and font size.



## Properties

### label: alias

This property holds the alias to Badge Label Component.
- **Inherited By**: Label

----

### light: alias

This property holds the alias to Badge light Component.
- **Inherited By**: Rectangle

---

### lightLabel: alias

This property holds the alias to Badge light Label Component.
- **Inherited By**: Label

----

### pill: bool

This property holds the set badges more rounded (default: false)

----

### state: string

This property holds the set contextual label types (default: "") states:

- primary
- secondary
- success
- danger
- warning
- info
- light
- dark

states use the pre-defined [Material Colors](https://doc.qt.io/qt-5/qtquickcontrols2-material.html#pre-defined-material-colors)

----


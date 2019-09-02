# Badge

This type is a badges, our small count and labeling component.


**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.7 or highter

**Inherits**: Rectangle


## Example

```js
    import "qrc:/QTypes" as QTypes

    Item {
        QTypes.Badge {
            text: "My badge text"
            state: "danger"
        }
    }
```

| Example   | Description |
| ------ | ------ |
| [Simple](https://github.com/RicGuerra/QTypes/tree/master/Examples/Badge/Simple.qml)             | Basic implementation.
| [Advanced](https://github.com/RicGuerra/QTypes/tree/master/Examples/Badge/Advanced.qml)         | Pill badge, Change colors and font size.


----

## Properties

### label: alias

This property holds the alias to Badge Label Component
- **Inherited By**: Label

----

### counter: alias

This property holds the alias to Mini Counter Badge Component
- **Inherited By**: Rectangle

---

### counterLabel: alias

This property holds the alias to Mini Counter Badge Label Component
- **Inherited By**: Label

----

### pill: bool

This property holds the set badges more rounded (default: false)

----

### text: string

This property holds the set the text to Badge, this is a short alias is the
same like label.text

----

### counterText: string

This property holds the set the text to Badge Light (default ""), if empty don't show the
Mini Counter Badge. This is a short alias is the same like counterLabel.text

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

### Including inherited
 [Rectangle QML Type](https://doc.qt.io/qt-5/qml-qtquick-rectangle.html)

----

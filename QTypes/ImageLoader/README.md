# ImageLoader

This type is a simple visual status image loader.
It show the progress when Image Loading and error thumbnail when status = Error.


**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.12 or highter

**Inherits**: Image


## Example

```js
    import "qrc:/QTypes" as QTypes

    Item {
        QTypes.ImageLoader {
            anchors.fill: parent
            source: "https://upload.wikimedia.org/wikipedia/commons/a/a0/%27Greeley_Panorama%27_from_Opportunity%27s_Fifth_Martian_Winter%2C_PIA15689.jpg"
        }
    }
```

| Example   | Description |
| ------ | ------ |
| [Simple](https://github.com/RicGuerra/QTypes/tree/master/Examples/ImageLoader/Simple.qml)           | Basic implementation
| [Advanced](https://github.com/RicGuerra/QTypes/tree/master/Examples/ImageLoader/Advanced.qml)       | Change Components, colors and add error image


----

## Properties

### errorComponent: Component

This property holds the set error Component when image status is Loading.
This replace the default error Component.
By default load errorComponent when errorImageSource is empty

----

### errorComponentColor: color

This property holds the set theme color to default errorComponent (default "Grey")

----

### errorImageSource: Component

This property holds the set image error when image status = Loading.
By default load the errorComponent when errorImageSource is empty

---

### loadingComponent: Component

This property holds the set loadingComponent when image status = Loading

----

### loadingComponentProgress: bool

Show or not the Progress Percentage when status = Loading

----

### loadingComponentProgressColor: color

This property holds the set theme color to default loadingComponent (default "Grey")

----

### Including inherited
 [Image QML Type](https://doc.qt.io/qt-5/qml-qtquick-image.html)

----

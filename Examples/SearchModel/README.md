# SearchModel

This type is a simple search in data models.
It can possible search in Data Models: ListModel or ObjectModel, or provided
by C++ model classes If a C++ model class is used, it must be a subclass of
QAbstractItemModel or a simple list.

Interact with QML Types ListView, Repeater, TableView and GridView

**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.7 or highter

**Inherited By**: TextField


## Examples

| Example   | Description |
| ------ | ------ |
| [Simple](https://github.com/RicGuerra/QTypes/tree/master/Examples/SearchModel/Simple.qml)           | Basic implementation
| [Advanced](https://github.com/RicGuerra/QTypes/tree/master/Examples/Accordion/Advanced.qml)         | Button reset and search in multiple Data Models types



## Properties

### list: variant

This property holds the set id to item how provides model data that is used to search in your model items.
Interact with QML Types ListView, Repeater, TableView and GridView an yours models can be ListModel, XmlListModel or ObjectModel, or provided by C++ model classes.
If a C++ model class is used, it must be a subclass of QAbstractItemModel or a simple list.

----

### ignoreKeys: list<String>

This property holds the set of keys to igonre in search.

---

### minSearchLength: int

The minimum length of the text to start the search filtring .
By default, this property contains a value of 1.

----

### caseSensitive: bool

By default, search in model data is not case sensitive.

----

## Signals

### results(list)

This signal is emitted when new results found.

----

## Methods

### reset()

Resets the list to the original list.

-----

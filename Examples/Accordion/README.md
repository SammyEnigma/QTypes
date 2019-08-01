# Accordion

This type is a simple Accordion displays collapsible content panels.
It can possible display in Data Models: ListModel or provided
by C++ model classes If a C++ model class is used, it must be a subclass of
QAbstractItemModel or a simple list.

**Import Statement**: import "qrc:/QTypes" as QTypes

**Requires**: Qt 5.7 or highter

**Inherited By**: ListView


## Examples

| Example   | Description |
| ------ | ------ |
| [Simple](https://github.com/RicGuerra/QType/tree/master/Examples/Accordion/Simple.qml)           | Basic implementation
| [Advanced](https://github.com/RicGuerra/QType/tree/master/Examples/Accordion/Advanced.qml)       | Change Head and Body Item



## Properties

### headerAccordionComponent: Component

This property holds the set of Header Component to each element of accordion.

Including inherited properties:

- selected : bool  - item is selected
- index : int  - index of item in list

----

### bodyAccordionComponent: Component

This property holds the set of body Component to selected item.

Including inherited properties:
- index : int  - index of item in list

----

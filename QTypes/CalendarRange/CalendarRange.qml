import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import Qt.labs.calendar 1.0
import QtQuick.Controls.Styles 1.1
import QtQuick.Controls.Material 2.12

Control {
    id: root
    //  width: widthOfMonths * numberOfMonths
    // height: heightOfMonths * numberOfMonths


    property int widthOfMonths: 104
    property int heightOfMonths: 104
    property int numberOfMonths: 2
    property bool weekNumberColumn: false
    property var startDate

    locale: Qt.locale()

    property var selectedDateFormat: "MMMM yyyy"

    property CalendarModel model: CalendarModel {
        id: calendarModel
        from: new Date(2015, 0, 1)
        to: new Date(2015, 1, 25)
    }

    contentItem: RowLayout {
            spacing: 8

        Repeater {
            id: listview
            model: calendarModel
            delegate: ColumnLayout {
                width: widthOfMonths
                height: heightOfMonths

                Item {
                    id: monthOfYear
                    Layout.fillWidth: true
                    height: heightOfMonths * 0.2

                    Label {
                        text: ctrl.month !==0 ? ctrl.title.replace(ctrl.year,"") : ctrl.title
                        font.capitalization: Font.Capitalize
                        anchors.centerIn: parent
                    }
                }

                GridLayout {
                    Layout.fillWidth: true
                    height: heightOfMonths - monthOfYear.height
                    columns: 2

                    DayOfWeekRow {
                        Layout.fillWidth: true
                        Layout.column: 1
                        locale: root.locale
                        delegate: Text {
                            font: ctrl.font
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: model.shortName[0].toUpperCase();
                        }
                    }

                    WeekNumberColumn {
                        visible: weekNumberColumn
                        Layout.fillHeight: true
                        month: ctrl.month
                        year: ctrl.year
                        locale: root.locale
                        delegate: Text {
                                font: ctrl.font
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: model.weekNumber
                            }
                    }

                    MonthGrid {
                        id: ctrl
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.row: 2
                        Layout.column: 1
                        background: Rectangle {
                            visible: model.date === startDate
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            radius: implicitWidth * 0.5
                            Component.onCompleted: console.log(parent.width)
                            border {
                                color: Material.color(Material.LightBlue)
                                width: 1
                            }
                        }
                        onClicked: startDate = date
                        month: model.month
                        year: model.year
                        locale: root.locale
                    }
                }
            }
        }
    }
}

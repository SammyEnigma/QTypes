import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import Qt.labs.calendar 1.0
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4


// ###########################################
// [1][ADD] - import QtQmlPlugins
import "qrc:/QTypes" as QTypes
// [END] #####################################

ColumnLayout {
    Layout.fillWidth: true

    ColumnLayout {
        Layout.fillWidth: true
        spacing: 5

        // ###########################################
        // [2][ADD] - CalendarRange

//        QTypes.CalendarRange {
//        }
        Calendar {
        minimumDate: new Date(2017, 0, 1)
        maximumDate: new Date(2018, 0, 1)
    }
    }
}

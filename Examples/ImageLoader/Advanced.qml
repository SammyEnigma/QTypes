import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12


// ###########################################
// [1][ADD] - import QTypes
import "qrc:/QTypes" as QTypes
// [END] #####################################

ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 20

        // ###########################################
        // [2][ADD] - ImageSync

        QTypes.ImageLoader {
            width: 60
            height: 60
            source: "https://upload.wik_imedia.org/wikipedia/commons/a/a0/%27Greeley_Panorama%27_from_Opportunity%27s_Fifth_Martian_Winter%2C_PIA15689.jpg"
        }

        QTypes.ImageLoader {
            width: 60
            height: 60
            // change the default error component to show some image if error
            errorImageSource: "qrc:/icons/round_error_black_18dp.png"
            source: "https://upload.wik_imedia.org/wikipedia/commons/a/a0/%27Greeley_Panorama%27_from_Opportunity%27s_Fifth_Martian_Winter%2C_PIA15689.jpg"
        }

        QTypes.ImageLoader {
            width: 60
            height: 60
            // change base color of default error Component
            errorComponentColor: "red"
            source: "https://upload.wik_imedia.org/wikipedia/commons/a/a0/%27Greeley_Panorama%27_from_Opportunity%27s_Fifth_Martian_Winter%2C_PIA15689.jpg"
        }

        QTypes.ImageLoader {
            width: 60
            height: 60
            // replace the default error component
            errorComponent: Text {
                text: qsTr("Error")
            }
            source: "https://upload.wiki_media.org/wikipedia/commons/2/28/%27Calypso%27_Panorama_of_Spirit%27s_View_from_%27Troy%27.jpg"
        }

        QTypes.ImageLoader {
            width: 60
            height: 60
            // replace the default error component
            loadingComponent: Text {
                text: qsTr("Loading..")
                OpacityAnimator {
                        target: parent
                        from: 0;
                        to: 1;
                        duration: 1000
                        running: true
                        loops: -1
                    }
            }
            source: "https://upload.wikimedia.org/wikipedia/commons/2/28/%27Calypso%27_Panorama_of_Spirit%27s_View_from_%27Troy%27.jpg"
        }


        QTypes.ImageLoader {
            width: 100
            height: 100
            source: "https://upload.wikimedia.org/wikipedia/commons/2/28/%27Calypso%27_Panorama_of_Spirit%27s_View_from_%27Troy%27.jpg"
        }
    }
}

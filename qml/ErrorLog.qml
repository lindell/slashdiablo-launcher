import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Popup {
    id: errorsPopup
    modal: true
    focus: true
    width: 850
    height: 500
    margins: 0
    padding: 0
    
    anchors.centerIn: root
    closePolicy: Popup.NoAutoClose

    // Background.
    Overlay.modal: Item {
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.8
        }
    }

    // Content.
    Rectangle {
        id: errorContent
        anchors.fill: parent
        width: 400
        height: 400
        color: "#000"
        border.color: "#1e1b26"
        border.width: 1

        Item {
            width: errorContent.width * 0.90
            height: errorContent.height * 0.80
            anchors.centerIn: parent

            Item {
                width: parent.width
                height: 30

                id: errorTitle

                Title {
                    text: "ERROR LOG"
                    font.pixelSize: 18
                }

                Separator{}
            }
            
            TextEdit {
                anchors.top: errorTitle.bottom
                anchors.topMargin: 20
                text: settings.errorLog
                readOnly: true
                wrapMode: Text.WordWrap
                selectByMouse: true
                font.family:"Courier New"
                font.pointSize: 11
                color: "#fff"
                selectedTextColor: "#ed8154"
                selectionColor: "#1d1d1d"
            }
        }
    }

    // Close button.
    PlainButton {
        id: closeButton
        label: "CLOSE"
        width: 100
        height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -25
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: errorsPopup.close()
    }

    onOpened: {
        settings.getErrorLog()
    }
}

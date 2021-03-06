import QtQuick 2.0
import QtQuick.Controls.Styles 1.2

Rectangle {
    id: emojiButton


    Text {
        id: emojiText
        color: "gray"
        text: qsTr(eCatText)
        font.pixelSize: emojiButton.width - 8
        anchors.centerIn: parent
    }


    state: "RELEASED"
    states: [
        State {
            name: "PRESSED"
            PropertyChanges {
                target: emojiText
                font.pixelSize: emojiButton.width - 10
            }
        },
        State {
            name: "RELEASED"
            PropertyChanges {
                target: emojiText
                font.pixelSize: emojiButton.width - 8
            }
        }
    ]


    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            emojiText.color = "black"
        }
        onExited: {
            emojiText.color = "gray"
        }
        onPressedChanged: {
            emojiButton.state = emojiButton.state == "PRESSED" ? "RELEASED" :  "PRESSED"
        }
        onClicked: {
            Qt.emojiClickedHandler(emojiText.text)
        }
    }

}

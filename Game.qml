import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml

ColumnLayout {
    property int currentTry: 0
    property string rightWord: "verac"

    signal win()

    signal lose()

    Repeater {
        id: words
        model: 5
        WordRow {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        }
    }
    TextField {
        id: inputWord

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        validator: RegularExpressionValidator {
            regularExpression: /([a-z]{5})|(^$)/
        }
        onAccepted: {
            let result = words.itemAt(currentTry).validateInput(rightWord, inputWord.text)
            ++currentTry
            if (result) {
                win()
                console.log("win")
                return
            }
            if (currentTry == 5) {
                lose()
                console.log("lose")
            }
            text: ""
        }
    }
}
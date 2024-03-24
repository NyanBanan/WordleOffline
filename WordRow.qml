import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml

RowLayout {
    Layout.fillWidth: true
    Repeater {
        id: chars
        model: 5
        delegate: Label {
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            background: Rectangle {
                color: "white"
                border.width: 1
                border.color: Colors.black
            }
        }
    }

    function validateInput(rightStr, inputStr) {
        let chNum;
        if (inputStr.length < 5) {
            chNum = inputStr.length
        } else {
            chNum = 5
        }
        let result = true
        for (let curCh = 0; curCh < chNum; curCh++) {
            let curItem = chars.itemAt(curCh)
            curItem.text = inputStr[curCh]
            if (inputStr[curCh] === rightStr[curCh]) {
                curItem.background.color = Colors.green
            } else if (rightStr.includes(inputStr[curCh])) {
                curItem.background.color = Colors.yellow
                result = false
            }
            else{
                result = false
            }
        }
        return result
    }
}
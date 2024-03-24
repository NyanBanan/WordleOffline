import QtCore
import QtQuick
import QtQuick.Controls

Rectangle {
    property Button button

    implicitWidth: 200
    implicitHeight: 50
    border.color: Colors.black
    border.width: 1
    Component.onCompleted: {
        color = Qt.binding(function () {
                if (button !== null) {
                    if (button.pressed) {
                        return Qt.lighter(Colors.yellow, 1.3);
                    } else if (button.hovered) {
                        return Colors.yellow;
                    }
                }
                return Colors.green;
            }
        )
    }
}
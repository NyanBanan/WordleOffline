import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml

ColumnLayout {
    property alias start: start
    property alias settings: settings
    property alias exit: exit
    
    Image {
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Layout.preferredWidth: 300
        Layout.preferredHeight: 200
        source: "qrc:/images/logo.png"
    }
    Button {
        id: start

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Layout.preferredWidth: 200
        Layout.preferredHeight: 50

        text: "Начать"
        background: Loader {
            source: "ButtonBackRect.qml"
        }
        Component.onCompleted: {
            background.item.button = start
        }
    }
    Button {
        id: settings

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Layout.preferredWidth: 200
        Layout.preferredHeight: 50

        text: "Настройки"
        background: Loader {
            source: "ButtonBackRect.qml"
        }
        Component.onCompleted: {
            background.item.button = settings
        }
    }
    Button {
        id: exit

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        text: "Выйти"
        background: Loader {
            source: "ButtonBackRect.qml"
        }
        Component.onCompleted: {
            background.item.button = exit
        }
    }
}
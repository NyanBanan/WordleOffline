import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtQml

ColumnLayout {
    property alias back: back

    RowLayout {
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Rectangle {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            implicitWidth: 120
            implicitHeight: 50

            color: Colors.green
            border.color: Colors.black
            border.width: 1
            Text {
                anchors.centerIn: parent
                text: "Апи для работы"
            }
        }
        TextField {
            id: apiUrlInput
        }
    }

    Button {
        id: save

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        text: "Сохранить"
        background: Loader {
            source: "ButtonBackRect.qml"
        }
        onClicked:{
            GameSettings.apiUrl = apiUrlInput.text
        }
        Component.onCompleted: {
            background.item.button = save
            apiUrlInput.text = GameSettings.apiUrl
        }
    }

    Button {
        id: back

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        text: "Назад"
        background: Loader {
            source: "ButtonBackRect.qml"
        }
        Component.onCompleted: {
            background.item.button = back
        }
    }
}
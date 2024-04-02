import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Dialogs
import QtQml

ColumnLayout {
    property alias back: back

    RowLayout {
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Rectangle {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            implicitWidth: 140
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
        Button{
            text: "..."
            implicitWidth: 70
            implicitHeight: 50
            onClicked:{
                fileDialog.open()
            }
        }
        FileDialog {
            id: fileDialog
            nameFilters: ["JSON files (*.json)"]
            onAccepted: apiUrlInput.text = currentFile //selectedFile doesnt exist in Qt.labs.platform
        }
    }
    RowLayout {
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Rectangle {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            implicitWidth: 140
            implicitHeight: 50

            color: Colors.green
            border.color: Colors.black
            border.width: 1
            Text {
                anchors.centerIn: parent
                text: "Текущий язык"
            }
        }
        Rectangle {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            implicitWidth: 120
            implicitHeight: 30

            color: "white"
            border.color: Colors.black
            border.width: 1
            Text {
                anchors.centerIn: parent
                text: GameSettings.language
            }
        }
    }
    RowLayout {
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Rectangle {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            implicitWidth: 140
            implicitHeight: 50

            color: Colors.green
            border.color: Colors.black
            border.width: 1
            Text {
                anchors.centerIn: parent
                text: "Доступные языки"
            }
        }
        ComboBox {
            id: language
            model: GameSettings.accessibleLanguages
        }
    }

    Button {
        id: save

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        text: "Сохранить"
        background: Loader {
            source: "ButtonBackRect.qml"
        }
        onClicked: {
            GameSettings.jsonData = apiUrlInput.text
            GameSettings.language = language.currentText
        }
        Component.onCompleted: {
            background.item.button = save
            apiUrlInput.text = GameSettings.jsonData
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
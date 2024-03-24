import QtCore
import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtQml

import QMLWordleModule

ApplicationWindow {
    visible: true
    background: Rectangle {
        id: back
        property double fillPosition: 0.4
        Behavior on fillPosition {
            NumberAnimation {
                duration: 1000
            }
        }
        gradient: RadialGradient {
            centerX: 50; centerY: 50
            centerRadius: 100
            focalX: centerX; focalY: centerY
            GradientStop {
                position: 0.0; color: "#a14545"
            }
            GradientStop {
                position: back.fillPosition + 0.1; color: "#d3bf33"
            }
            GradientStop {
                position: 1.0; color: "#618B55"
            }
        }
    }

    Timer {
        interval: 1200; running: true; repeat: true
        onTriggered: back.fillPosition = Math.random() * 0.8 + 0.1
    }

    StackView {
        id: mainStack
        anchors.fill: parent

        initialItem: menu
    }

    Component {
        id: menu
        MainMenu {
            start.onClicked: {
                mainStack.push(gameWidget)
            }
            settings.onClicked: {
                mainStack.push(settingsWidget)
            }
            exit.onClicked: {Qt.quit()}
            Component.onCompleted: {
                console.log("mainmenu")
            }
        }
    }

    Connections{
        target: wordProvider
        function onError(message){
            errorDialog.text = message
            errorDialog.open()
        }
    }

    Connections{
        target: GameSettings
        function onApiUrlChanged(){
            wordProvider.parseFile(GameSettings.apiUrl);
        }
    }

    JsonWordProvider {
        id: wordProvider
        Component.onCompleted: {
            parseFile(GameSettings.apiUrl);
        }
    }

    MessageDialog {
        id: errorDialog
        buttons: MessageDialog.Ok
    }

    Component {
        id: settingsWidget
        SettingsMenu {
            back.onClicked: {
                mainStack.pop()
            }
            Component.onCompleted: {
                console.log("settings")
            }
        }
    }
    Component {
        id: gameWidget
        Game {
            id: game
            onWin: {
                mainStack.push(winScreen)
            }
            onLose: {
                mainStack.push(loseScreen)
            }
            Component.onCompleted: {
                console.log("game")
                rightWord = wordProvider.getRandomWord()
                console.log(rightWord)
            }
        }
    }
    Component {
        id: winScreen
        WinScreen {
            clickArea.onClicked: {
                mainStack.pop()
                mainStack.pop()
            }
        }
    }
    Component {
        id: loseScreen
        LoseScreen {
            clickArea.onClicked: {
                mainStack.pop()
                mainStack.pop()
            }
        }
    }
    WinScreen{}
}
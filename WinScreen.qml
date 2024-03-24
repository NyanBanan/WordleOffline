import QtCore
import QtQuick
import QtMultimedia

Image{
    property alias clickArea: clickArea
    source: "qrc:/images/win.png"
    MouseArea{
        id: clickArea
        anchors.fill: parent
    }
    Component.onCompleted:{
        victorySound.play()
    }
    SoundEffect {
        id: victorySound
        source: "qrc:/audio/VictoryAudio.wav"
    }
}
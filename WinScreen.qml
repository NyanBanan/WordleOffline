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
}
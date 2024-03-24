import QtCore
import QtQuick

Image{
    property alias clickArea: clickArea
    source: "qrc:/images/lose.png"
    MouseArea{
        id: clickArea
        anchors.fill: parent
    }
}
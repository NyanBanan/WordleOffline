pragma Singleton
import QtCore

Settings{
    property string jsonData: "./wordlist.json"
    property string language: "russian"
    property var accessibleLanguages: ["русский", "english"]
}
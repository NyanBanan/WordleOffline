cmake_minimum_required(VERSION 3.27)
project(QMLWordle)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_PREFIX_PATH "/usr/local/Qt-6.6.3/lib/cmake")

find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets Quick Qml Multimedia)

add_executable(QMLWordle main.cpp)

set_source_files_properties(Colors.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(GameSettings.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)


qt_add_qml_module(QMLWordle
        VERSION 1.0
        URI QMLWordleModule
        RESOURCE_PREFIX /
        SOURCES
        JsonWordProvider.cpp
        QML_FILES
        main.qml
        Game.qml
        GameSettings.qml
        ButtonBackRect.qml
        Colors.qml
        MainMenu.qml
        SettingsMenu.qml
        LoseScreen.qml
        WordRow.qml
        WinScreen.qml
)

target_link_libraries(QMLWordle PRIVATE Qt6::Core Qt6::Widgets Qt6::Gui Qt6::Quick Qt6::Qml Qt6::Multimedia)

qt_add_resources(QMLWordle "images"
        PREFIX "/"
        FILES ./images/logo.png
        ./images/back.png
        ./images/win.png
        ./images/lose.png
)


set_source_files_properties(./audio/VictoryClassicLeagueofLegendsAnnouncer-SoundEffectforediting.mp3 PROPERTIES QT_RESOURCE_ALIAS VictorySound.wav)
set_source_files_properties(./audio/DefeatClassicLeagueofLegendsAnnouncer-SoundEffectforediting.mp3 PROPERTIES QT_RESOURCE_ALIAS DefeatSound.wav)

qt_add_resources(QMLWordle "audio"
        PREFIX "/"
        FILES ./audio/VictoryClassicLeagueofLegendsAnnouncer-SoundEffectforediting.wav
        ./audio/DefeatClassicLeagueofLegendsAnnouncer-SoundEffectforediting.wav
)

if (ANDROID)
    set_target_properties(QMLWordle PROPERTIES
            QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../android"
    )
endif ()
#include <QApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QSettings>

int main(int argc, char* argv[]){
    QApplication app(argc, argv);

    app.setOrganizationName("Some Company");
    app.setOrganizationDomain("somecompany.com");
    app.setApplicationName("Amazing Application");

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/QMLWordleModule/main.qml")));

    return app.exec();
}

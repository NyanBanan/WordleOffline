//
// Created by nyanbanan on 20.03.24.
//

#ifndef QMLWORDLE_JSONWORDPROVIDER_HPP
#define QMLWORDLE_JSONWORDPROVIDER_HPP

#include <QJsonObject>
#include <QRandomGenerator>
#include <QtQml>
#include <QObject>

class JsonWordProvider: public QObject{
    Q_OBJECT
    QML_ELEMENT
public:
    Q_INVOKABLE
    QString getRandomWord();

    Q_INVOKABLE
    void parseFile(QString path);
    void parseJson(QJsonArray json);
signals:
    void error(QString message);

private:
    QList<QString> _words;
};


#endif //QMLWORDLE_JSONWORDPROVIDER_HPP

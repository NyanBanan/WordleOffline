//
// Created by nyanbanan on 25.03.24.
//

#ifndef QMLWORDLE_GEOPOSACCESSMANAGER_HPP
#define QMLWORDLE_GEOPOSACCESSMANAGER_HPP

#include <QObject>
#include <QString>
#include <QNetworkAccessManager>
#include <QtQml>

class GeoPosAccessManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString country READ getLastCountry NOTIFY lastCountryUpdated)
public:
    GeoPosAccessManager();

    Q_INVOKABLE
    void updateGeoLocation();
    QString getLastCountry();
    signals:
    void lastCountryUpdated(QString new_country);
    void error(QString message);
private:
    void handleReply(QNetworkReply *reply);
    QNetworkAccessManager _manager;
    QString _last_country;
};


#endif //QMLWORDLE_GEOPOSACCESSMANAGER_HPP

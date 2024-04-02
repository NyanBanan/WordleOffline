
//
// Created by nyanbanan on 25.03.24.
//


#include "GeoPosAccessManager.hpp"

GeoPosAccessManager::GeoPosAccessManager() {
    connect(&_manager, &QNetworkAccessManager::finished,
            this, &GeoPosAccessManager::handleReply);
}

void GeoPosAccessManager::updateGeoLocation() {
    _manager.get(QNetworkRequest(QUrl("http://ip-api.com/json/?fields=country")));
}

void GeoPosAccessManager::handleReply(QNetworkReply *reply) {
    reply->deleteLater();
    if (reply->error() != QNetworkReply::NoError) {
        emit error(reply->errorString());
        return;
    }
    auto code = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
    if (code != 200) {
        emit error(reply->errorString());
        return;
    }
    auto body = reply->readAll();
    QJsonDocument body_doc = QJsonDocument::fromJson(body);
    QJsonObject body_json = body_doc.object();
    if(!body_json.contains("country")){
        emit error("Wrong body");
        return;
    }
    auto new_country = body_json.value("country").toString();
    if(_last_country != new_country){
        _last_country = new_country;
        emit lastCountryUpdated(_last_country);
    }
}

QString GeoPosAccessManager::getLastCountry() {
    return _last_country;
}

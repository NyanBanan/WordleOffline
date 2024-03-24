//
// Created by nyanbanan on 20.03.24.
//

#include "JsonWordProvider.hpp"

QString JsonWordProvider::getRandomWord() {
    return _words.value(QRandomGenerator::global()->bounded(0, _words.size()));
}

void JsonWordProvider::parseJson(QJsonArray json) {
    for (auto obj: json) {
        _words.push_back(obj.toString());
    }
}

void JsonWordProvider::parseFile(QString path) {
    QFile file_stream{path};
    if (!file_stream.open(QIODevice::ReadOnly)) {
        emit error("Uncorrected file");
        return;
    }
    auto json_data = QJsonDocument::fromJson(file_stream.readAll());
    if (json_data.isNull()) {
        emit error("Uncorrected json format");
        return;
    }
    auto json_object = json_data.object();
    if (!json_object.contains("wordlist")){
        emit error("Uncorrected json format");
        return;
    }
    auto json_array = json_object.value("wordlist").toArray();
    parseJson(json_array);
}

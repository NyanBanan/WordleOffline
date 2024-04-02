//
// Created by nyanbanan on 20.03.24.
//

#include "JsonWordProvider.hpp"

QString JsonWordProvider::getRandomWord(QString language) {
    if (!_words.contains(language)){
        emit error(QString("%1 language not exist").arg(language));
        return language == "english" ? "error": "ересь";
    }
    auto word_list =  _words.value(language);
    if (word_list.empty()){
        emit error(QString("%1 language empty").arg(language));
        return language == "english" ? "error": "ересь";
    }
    auto word = word_list.value(QRandomGenerator::global()->bounded(0, word_list.size()));
    return word;
}

void JsonWordProvider::parseJson(QJsonObject json) {
    _words.clear();
    for (auto obj = json.begin(); obj != json.end(); ++obj) {
        if (!obj.value().isArray()) {
            emit error(QString("%1 key value is not array").arg(obj.key()));
            continue;
        }
        QList<QString> words_list ;
        for (auto word: obj.value().toArray()) {
            words_list.append(word.toString().toLower());
        }
        _words.insert(obj.key(), words_list);
    }
}

void JsonWordProvider::parseFile(QString path) {
    path.replace(QRegularExpression("^(file:[/]{2})"), "");
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
    if (!json_data.isObject()) {
        emit error("Uncorrected json format");
        return;
    }
    auto json_object = json_data.object();
    parseJson(json_object);
}

QStringList JsonWordProvider::getLanguages() {
    return _words.keys();
}

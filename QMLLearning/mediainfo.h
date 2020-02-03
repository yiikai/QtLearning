#ifndef MEDIAINFO_H
#define MEDIAINFO_H
#include <QObject>

class mediaInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString medianame READ medianame WRITE setMedianame)
public:
    mediaInfo(){}
    mediaInfo(QObject* parent);
    QString medianame();
    void setMedianame(QString& name);
signals:
    void mediastart();

private:
    QString m_name;

};

#endif // MEDIAINFO_H

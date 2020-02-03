#include "mediainfo.h"

mediaInfo::mediaInfo(QObject* parent):QObject(parent),m_name("default")
{

}

QString mediaInfo::medianame()
{
    return m_name;
}

void mediaInfo::setMedianame(QString& name)
{
    m_name = name;
    emit mediastart();
}

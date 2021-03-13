#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "model.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    qRegisterMetaType<TodoItem>("TodoItem");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    TodoModel *model = new TodoModel;
    context->setContextProperty("mymodel", model);
    qmlRegisterType<TodoItem>("todoItem", 1, 0, "TodoItem");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

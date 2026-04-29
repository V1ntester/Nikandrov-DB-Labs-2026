#ifndef ADDITIONALWINDOW_H
#define ADDITIONALWINDOW_H

#include <QLabel>
#include <QMainWindow>
#include <QSqlDatabase>

#include <memory>

namespace Ui {
class AdditionalWindow;
}

class AdditionalWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit AdditionalWindow(std::shared_ptr<QSqlDatabase> dbconn, QString attr, QWidget *parent = nullptr);
    ~AdditionalWindow();

private:
    Ui::AdditionalWindow *ui;

    std::shared_ptr<QSqlDatabase> d_dbconn;

    QString d_attr;
};

#endif // ADDITIONALWINDOW_H

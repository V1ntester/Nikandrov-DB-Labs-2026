#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSqlDatabase>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

public slots:
    /// @brief creates a connection to database
    void dbconnect();

    /// @brief creates new entry
    void create();
    /// @brief selects all entries
    void selectAll(); 
    /// @brief updates selected entry
    void update();
    /// @brief removes selected entry
    void remove();
    /// @brief inserts text into the data form
    void onSelectionChanged();

private:
    Ui::MainWindow *ui;

    QSqlDatabase dbconn;
};
#endif // MAINWINDOW_H

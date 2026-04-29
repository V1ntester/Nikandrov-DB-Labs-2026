#include "additionalwindow.h"
#include "ui_additionalwindow.h"

#include <QSqlError>
#include <QMessageBox>
#include <QSqlQuery>

AdditionalWindow::AdditionalWindow(std::shared_ptr<QSqlDatabase> dbconn, QString attr, QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::AdditionalWindow)
{
    ui->setupUi(this);

    ui->twEmployees->setColumnCount(3);

    ui->twEmployees->setAutoScroll(true);

    ui->twEmployees->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->twEmployees->setSelectionBehavior(QAbstractItemView::SelectRows);

    ui->twEmployees->setHorizontalHeaderItem(0, new QTableWidgetItem("Email"));
    ui->twEmployees->setHorizontalHeaderItem(1, new QTableWidgetItem("Full Name"));
    ui->twEmployees->setHorizontalHeaderItem(2, new QTableWidgetItem("Position"));

    ui->twEmployees->horizontalHeader()->setStretchLastSection(true);

    ui->twEmployees->setEditTriggers(QAbstractItemView::NoEditTriggers);

    d_dbconn = dbconn;
    d_attr = attr;

    if (!d_dbconn->isOpen())
    {
        QMessageBox::critical(this, "Error", d_dbconn->lastError().text());
        return;
    }

    QSqlQuery query(*d_dbconn);
    QString sqlstr = "SELECT * FROM employees WHERE abbr = ?";

    query.prepare(sqlstr);
    query.bindValue(0, d_attr);

    if (!query.exec())
    {
        QMessageBox::critical(this, "Error", query.lastError().text());
        return;
    }

    if (query.isActive())
    {
        ui->twEmployees->setRowCount(query.size());
    }
    else
    {
        ui->twEmployees->setRowCount(0);
    }

    int i = 0;

    while (query.next())
    {
        ui->twEmployees->setItem(i, 0, new QTableWidgetItem(query.value("email").toString()));
        ui->twEmployees->setItem(i, 1, new QTableWidgetItem(query.value("full_name").toString()));
        ui->twEmployees->setItem(i, 2, new QTableWidgetItem(query.value("position").toString()));

        i++;
    }
}

AdditionalWindow::~AdditionalWindow()
{
    delete ui;
}

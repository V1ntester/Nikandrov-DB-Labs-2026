#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QSqlError>
#include <QMessageBox>
#include <QSqlQuery>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->btnConnect, SIGNAL(clicked(bool)), this, SLOT(dbconnect()));

    connect(ui->btnAdd, SIGNAL(clicked(bool)), this, SLOT(create()));
    connect(ui->btnSelectAll, SIGNAL(clicked(bool)), this, SLOT(selectAll()));
    connect(ui->btnEdit, SIGNAL(clicked(bool)), this, SLOT(update()));
    connect(ui->btnDel, SIGNAL(clicked(bool)), this, SLOT(remove()));
    connect(ui->twOrg, SIGNAL(itemSelectionChanged()), this, SLOT(onSelectionChanged()));

    ui->twOrg->setColumnCount(4);

    ui->twOrg->setAutoScroll(true);

    ui->twOrg->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->twOrg->setSelectionBehavior(QAbstractItemView::SelectRows);

    ui->twOrg->setHorizontalHeaderItem(0, new QTableWidgetItem("Abbr"));
    ui->twOrg->setHorizontalHeaderItem(1, new QTableWidgetItem("Title"));
    ui->twOrg->setHorizontalHeaderItem(2, new QTableWidgetItem("City"));
    ui->twOrg->setHorizontalHeaderItem(3, new QTableWidgetItem("INN"));

    ui->twOrg->horizontalHeader()->setStretchLastSection(true);

    ui->twOrg->setSortingEnabled(true);
    ui->twOrg->sortByColumn(0, Qt::AscendingOrder);

    ui->twOrg->setEditTriggers(QAbstractItemView::NoEditTriggers);
}

MainWindow::~MainWindow()
{
    if (dbconn.isOpen())
        dbconn.close();
    delete ui;
}

void MainWindow::dbconnect()
{
    if (!dbconn.isOpen())
    {
        ui->teResult->append("SQL drivers:");
        ui->teResult->append(QSqlDatabase::drivers().join(","));

        dbconn = QSqlDatabase::addDatabase("QPSQL");

        dbconn.setDatabaseName("dbtest");
        dbconn.setHostName("localhost");
        dbconn.setUserName("postgres");
        dbconn.setPassword("root");

        if (dbconn.open())
        {
            ui->teResult->append("Connect is open...");
        }
        else
        {
            ui->teResult->append("Error of connect:");
            ui->teResult->append(dbconn.lastError().text());
        }
    }
    else
    {
        ui->teResult->append("Connect already is open...");
    }
}

void MainWindow::create()
{
    if (!dbconn.isOpen())
    {
        dbconnect();
        if (!dbconn.isOpen())
        {
            QMessageBox::critical(this, "Error", dbconn.lastError().text());
            return;
        }
    }
    QSqlQuery query(dbconn);

    QString sqlstr = "INSERT INTO org (abbr, title, city, inn) VALUES (?,?,?,?)";

    query.prepare(sqlstr);

    query.bindValue(0, ui->leAbbr->text());
    query.bindValue(1, ui->teTitle->toPlainText());
    query.bindValue(2, ui->leCity->text());

    query.bindValue(3, ui->leInn->text().toLongLong());

    if (!query.exec())
    {
        ui->teResult->append(query.lastQuery());
        QMessageBox::critical(this, "Error", query.lastError().text());
        return;
    }

    ui->teResult->append(QString("AddRead %1rows").arg(query.numRowsAffected()));

    selectAll();
}

void MainWindow::selectAll()
{

    ui->twOrg->clearContents();

    if (!dbconn.isOpen())
    {
        dbconnect();
    }
    if (!dbconn.isOpen())
    {
        QMessageBox::critical(this, "Error", dbconn.lastError().text());
        return;
    }

    QSqlQuery query(dbconn);

    QString sqlstr = "SELECT * FROM org";

    if (!query.exec(sqlstr))
    {
        QMessageBox::critical(this, "Error", query.lastError().text());
        return;
    }

    if (query.isActive())
    {
        ui->twOrg->setRowCount(query.size());
    }
    else
    {
        ui->twOrg->setRowCount(0);
    }

    ui->teResult->append(QString("Read %1 rows").arg(query.size()));

    ui->twOrg->setSortingEnabled(false);

    int i = 0;
    while (query.next())
    {
        ui->twOrg->setItem(i, 0, new QTableWidgetItem(query.value("abbr").toString()));
        ui->twOrg->setItem(i, 1, new QTableWidgetItem(query.value("title").toString()));
        ui->twOrg->setItem(i, 2, new QTableWidgetItem(query.value("city").toString()));
        ui->twOrg->setItem(i, 3, new QTableWidgetItem(query.value("inn").toString()));
        i++;
    }

    ui->twOrg->setSortingEnabled(true);
}

void MainWindow::update()
{

    if (!dbconn.isOpen())
    {
        dbconnect();
        if (!dbconn.isOpen())
        {
            QMessageBox::critical(this, "Error", dbconn.lastError().text());
            return;
        }
    }
    QSqlQuery query(dbconn);

    QString sqlstr = "UPDATE org SET title = ?, city = ?, inn = ? WHERE abbr = ?";

    query.prepare(sqlstr);

    query.bindValue(0, ui->teTitle->toPlainText());
    query.bindValue(1, ui->leCity->text());
    query.bindValue(2, ui->leInn->text().toLongLong());
    query.bindValue(3, ui->leAbbr->text());

    if (!query.exec())
    {
        ui->teResult->append(query.lastQuery());
        QMessageBox::critical(this, "Error", query.lastError().text());
        return;
    }

    ui->teResult->append(QString("UpdateRead %1rows").arg(query.numRowsAffected()));

    selectAll();
}

void MainWindow::remove()
{
    if (!dbconn.isOpen())
    {
        dbconnect();

        if (!dbconn.isOpen())
        {
            QMessageBox::critical(this, "Error", dbconn.lastError().text());
            return;
        }
    }

    int currow = ui->twOrg->currentRow();

    if (currow < 0)
    {
        QMessageBox::critical(this, "Error", "Not selected row!");
        return;
    }

    if (QMessageBox::question(this, "Delete", "Delete row?",
                              QMessageBox::Cancel, QMessageBox::Ok) == QMessageBox::Cancel)
    {
        return;
    }

    QSqlQuery query(dbconn);

    QString sqlstr = "DELETE FROM org WHERE abbr = '" + ui->twOrg->item(currow, 0)->text() + "'";

    if (!query.exec(sqlstr))
    {
        ui->teResult->append(query.lastQuery());
        QMessageBox::critical(this, "Error", query.lastError().text());
        return;
    }

    ui->teResult->append(QString("Del %1 rows").arg(query.numRowsAffected()));

    selectAll();
}

void MainWindow::onSelectionChanged()
{
    int row = ui->twOrg->currentRow();
    if (row < 0)
        return;

    ui->leAbbr->setText(ui->twOrg->item(row, 0)->text());
    ui->teTitle->setPlainText(ui->twOrg->item(row, 1)->text());
    ui->leCity->setText(ui->twOrg->item(row, 2)->text());
    ui->leInn->setText(ui->twOrg->item(row, 3)->text());
}
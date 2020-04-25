var ascending = true;

function hideAdminDeleteUrl() {

    var totalPlayers = 0;
    var adminRow = document.getElementById("admin");
    adminRow.style.backgroundColor = "#ccccff";
    document.getElementById("admin").getElementsByTagName("TD")[10].style.display = "none";     

    table1 = document.getElementById("myTable");
    var rows = table1.rows;

    for (let i = 1; i < (rows.length); i++) {

        datesColumn = document.getElementById("myTable").rows[i].cells;
        datesColumn[4].innerHTML = datesColumn[4].innerHTML.substring(0, 10);
        datesColumn[4].style.textAlign = "center";

        totalPlayers += 1;
    }

    document.getElementById("playersSum").innerHTML = '<b>Total Players :  ' + totalPlayers + '  </b>';
}

var balance = "balance";
var balanceColumn = 6;
var totalGames = "totalGames";
var gamesColumn = 7;
var totalWins = "totalWins";
var winsColumn = 8;
var playerId = "playerId";
var idsColumn = 0;
var firstName = "firstName";
var firstNameColumn = 1;
var lastName = "lastName";
var lastNameColumn = 2;
var userName = "userName";
var userNameColumn = 3;
var dateOfBirth = "dateOfBirth";
var dateOfBirthColumn = 4;
var playerEmail = "playerEmail";
var playerEmailColumn = 5;

function sortByInteger(columnID, columnNumber) {
    
  
    tableHeadRow = document.getElementById("myTable").rows[0].cells;
     for (let i = 0; i <= 8; i++) {
         tableHeadRow[i].style.backgroundColor = "";
    }
    
    document.getElementById(columnID).style.backgroundColor = "#99ccff";
    
      var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTable");
    switching = true;

    if (ascending) {
        ascending = false;
        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {

                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[columnNumber].innerHTML;
                y = rows[i + 1].getElementsByTagName("TD")[columnNumber].innerHTML;

                if (x / 1 > y / 1) {
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {

                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    } else if (!ascending) {
        ascending = true;
        document.getElementById(columnID).style.backgroundColor = "#ffccff";
        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {

                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[columnNumber].innerHTML;
                y = rows[i + 1].getElementsByTagName("TD")[columnNumber].innerHTML;


                if (x / 1 < y / 1) {

                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }
}

function sortByString(columnID, columnNumber) {
    
    tableHeadRow = document.getElementById("myTable").rows[0].cells;
     for (let i = 0; i <= 8; i++) {
         tableHeadRow[i].style.backgroundColor = "";
    }

    document.getElementById(columnID).style.backgroundColor = "#99ccff";

    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTable");
    switching = true;

    if (ascending) {
        ascending = false;
        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {

                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[columnNumber].innerHTML;
                y = rows[i + 1].getElementsByTagName("TD")[columnNumber].innerHTML;

                if (x.toLowerCase() > y.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {

                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    } else if (!ascending) {
        ascending = true;
        document.getElementById(columnID).style.backgroundColor = "#ffccff";
        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {

                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[columnNumber].innerHTML;
                y = rows[i + 1].getElementsByTagName("TD")[columnNumber].innerHTML;


                if (x.toLowerCase() < y.toLowerCase()) {

                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }
}

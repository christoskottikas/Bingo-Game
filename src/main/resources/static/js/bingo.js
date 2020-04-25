
var gamesPlayed = document.getElementById('totalGames2').innerHTML;
var gamesWon = document.getElementById('totalWins2').innerHTML;




function Card() {


    Card.autoDaub = true;
    Card.balls = [];
    Card.clearBalls = 6;
    Card.instance = this;
    Card.time = null;
    Card.winMethod = "";
    this.card = [[], [], [], [], []];
}



Card.bingo = function () {


    if (Card.checkBingo()) {


        console.log(Card.winMethod);
        Card.won();
    }
}; // bingo


Card.drawBall = function () {


    var balls = Card.balls.length;
    if (balls < 51) {


        document.getElementById("center").innerHTML =
                "" + (50 - balls) + ((balls != 49) ?
                " balls" : " ball");
        for (var i = 0; i < 4; i++) {


            document.getElementById("b" + i).classList.
                    remove("b", "i", "n", "g", "o", "h");
            document.getElementById("b" + i).classList.
                    add(document.getElementById("b" + (i + 1)).
                            classList.item(0));


            document.getElementById("b" + i + "t").classList.
                    remove("v", "t");
            document.getElementById("b" + i + "t").classList.
                    add(document.getElementById(
                            "b" + (i + 1) + "t").classList.item(0));


            document.getElementById("b" + i + "t").innerHTML =
                    document.getElementById("b" + (i + 1) + "t").
                    innerHTML;
        } // for


        var ball = Card.nextBall();
        var col = Card.getColumn(ball);


        document.getElementById("b4").classList.
                remove("b", "i", "n", "g", "o", "h");
        document.getElementById("b4").classList.
                add(Card.getClass(col));


        document.getElementById("b4t").classList.
                remove("v", "t");
        document.getElementById("b4t").classList.
                add("t");


        if (ball < 10)
            document.getElementById("b4t").innerHTML =
                    "\u202f" + ball;
        else
            document.getElementById("b4t").innerHTML = ball;


        if (Card.autoDaub) {


            var index =
                    Card.instance.card[col].indexOf(ball);
            if (index >= 0) {


                var obj =
                        document.getElementById("d" + index + col);
                obj.classList.remove("v", "t", "e");
                obj.classList.add("v");


                if (Card.checkBingo()) {
                    window.clearTimeout(Card.time);
                    Card.time = window.setInterval(
                            Card.won, 3000);
                } // if
            } // if
        } // if


    } else if (--Card.clearBalls &&
            !Card.autoDaub) {


        for (var i = 0; i < 4; i++) {


            document.getElementById("b" + i).classList.
                    remove("b", "i", "n", "g", "o", "h");
            document.getElementById("b" + i).classList.
                    add(document.getElementById("b" + (i + 1)).
                            classList.item(0));


            document.getElementById("b" + i + "t").classList.
                    remove("v", "t");
            document.getElementById("b" + i + "t").classList.
                    add(document.getElementById(
                            "b" + (i + 1) + "t").classList.item(0));


            document.getElementById("b" + i + "t").innerHTML =
                    document.getElementById("b" + (i + 1) + "t").
                    innerHTML;
        } // for


        document.getElementById("b4").classList.
                remove("b", "i", "n", "g", "o", "h");
        document.getElementById("b4").classList.
                add("h");


        document.getElementById("b4t").classList.
                remove("v", "t");
        document.getElementById("b4t").classList.
                add("v");


    } else {
        window.clearTimeout(Card.time);

        gamesPlayed = gamesPlayed / 1 + 1;
        gamesWon = gamesWon / 1 + 0;
        Alert.render(" Game over. Play again for another 20 ");
    }
};


Card.checkBingo = function () {


    var rsl = false;
    var bingos =
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5];
    var objs = document.getElementsByClassName("v");
    for (var i = 0; i < objs.length; i++) {


        var row = objs[i].id.charAt(1) - '0';
        var col = objs[i].id.charAt(2) - '0';


        if (--bingos[row] == 0) {
            rsl = true;
            Card.winMethod = " Bingo Across [ " +
                    (row + 1) + " ] row ";
        }
        if (--bingos[col + 5] == 0) {
            rsl = true;
            Card.winMethod = ` Bingo Down [ ` +
                    Card.getClass(col).toUpperCase() + " ] column ";
        }
        if (row == col && --bingos[10] == 0) {
            rsl = true;
            Card.winMethod = ` Bingo diagonally [ \\ ] `;
        }
        if (row + col == 4 && --bingos[11] == 0) {
            rsl = true;
            Card.winMethod = ` Bingo diagonally [ / ] `;
        }
        if (row % 2 == 0 && (row == col ||
                row + col == 4) && --bingos[12] == 0) {
            rsl = true;
            Card.winMethod = ` Bingo Corners `;
        }
    }  // for


    return rsl;
};// checkBingo


Card.daub = function (obj) {


    var cls = obj.classList.item(0);
    var num = parseInt(obj.innerHTML);
    var index = Card.balls.indexOf(num);
    obj.classList.remove("v", "t", "e");


    if (index >= 0 || cls == "e")
        if (cls == "t")
            obj.classList.add("v");

        else
            obj.classList.add("t");
    else
        obj.classList.add("e");
};


Card.getClass = function (column) {
    return ["b", "i", "n", "g", "o"][column];
}; // getClass


Card.getColumn = function (ball) {
    return Math.floor((ball - 1) / 15);
}; // getColumn


Card.prototype.getNumber = function (column) {


    var ofs = column * 15 + 1;
    var num = Math.floor(Math.random() * 15) + ofs;
    do {
        var i = this.card[column].indexOf(num);
        if (i >= 0)
            num = num % 15 + ofs;
    } while (i >= 0);
    this.card[column].push(num);
    return num;
}; // getNumber


Card.nextBall = function () {


    var ball = Math.floor(Math.random() * 75) + 1;
    do {
        var i = Card.balls.indexOf(ball);
        if (i >= 0)
            ball = ball % 75 + 1;
    } while (i >= 0);
    Card.balls.push(ball);
    return ball;
}; // nextBall


Card.prototype.reset = function () {

    Card.balls = [];
    Card.clearBalls = 6;
    Card.time = null;
    Card.winMethod = "";
    this.card = [[], [], [], [], []];
}; // reset


Card.setupCard = function () {


    document.getElementById("center").innerHTML =
            "50 balls";
    var obj;
    if (Card.instance == null)
        obj = new Card();
    else {
        obj = Card.instance;
        obj.reset();
    }



    for (var column = 0; column < 5; column++) {
        for (var row = 0; row < 5; row++) {


            var num;
            if (column == 2 && row == 2) {
                num = 0;
                obj.card[column].push(num);
                Card.balls.push(num);
            } else
                num = obj.getNumber(column);


            var data = document.getElementById(
                    "d" + row + column);
            if (num < 10)
                data.innerHTML = "\u202f" + num;
            else
                data.innerHTML = num;


            data.classList.remove("t", "v", "e");
            if (num == 0)
                data.classList.add("v");
            else
                data.classList.add("t");
        } // for


        document.getElementById("b" + column).classList.
                remove("b", "i", "n", "g", "o");
        document.getElementById("b" + column).classList.
                add("h");


        document.getElementById("b" + column + "t").classList.
                remove("t");
        document.getElementById("b" + column + "t").classList.
                add("v");
    } // for


    Card.time = window.setInterval(Card.drawBall,
            500);
}; // setupCard


Card.toggleDaub = function (obj) {
    Card.autoDaub = !Card.autoDaub;
    if (Card.autoDaub)
        obj.value = "Manual";
    else
        obj.value = "Auto";
};



Card.won = function () {

    window.clearTimeout(Card.time);
    gamesPlayed = gamesPlayed / 1 + 1;
    gamesWon = gamesWon / 1 + 1;
    Alert.render("Congrats you won by " + Card.winMethod + ". Play again for another 20 ");
}; // won



function CustomAlert() {
    this.render = function (dialog) {
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH + "px";
        dialogbox.style.left = (winW / 2) - (550 * .5) + "px";
        dialogbox.style.top = "30%";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "<h4>The game has ended</h4>";
        document.getElementById('dialogboxbody').innerHTML = `<h5>` + dialog + `<i class="fas fa-coins" style="color:gold"></i>&nbsp?</h5>`;
        document.getElementById('dialogboxfoot').innerHTML = '<button class="btn btn-success" onclick="Alert.ok()">Continue</button>&nbsp&nbsp<button class="btn btn-danger" onclick="Alert.stop()">Stop Playing</button>';
    };
    this.ok = function () {



        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";

        document.getElementById(('totalGames2')).innerHTML = gamesPlayed;
        document.getElementById(('totalWins2')).innerHTML = gamesWon;

        if (Card.autoDaub) {
            document.getElementById("daub").value = "Manual";
            Card.setupCard();
        } else
        {
            document.getElementById("daub").value = "Auto";
            Card.setupCard();
        }

    };

    this.stop = function () {



        document.write(`<body style="background-color: #DBB1BC">
                    <p style="font-size:40px;font-weight:bold;color: #B0FFFF;text-align: center">Thanks for playing.</p>
                    <div style="text-align: center"><form action="/gameOver/${gamesPlayed}/${gamesWon}" method="Post">
                    <input type="submit" style="background-color: #034f84;border: none;color: white;padding: 15px 32px;
                    text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;"
                    value="Sign out" />
                    </form></div></body>`);

        onDisconnected();
    };
}
var Alert = new CustomAlert();
  
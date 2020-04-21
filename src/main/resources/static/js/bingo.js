
var gamesPlayed = document.getElementById('totalGames2').innerHTML;
var gamesWon = document.getElementById('totalWins2').innerHTML;



function Card() {

    // Initialize all of the properties.
    Card.autoDaub = false;
    Card.balls = [];
    Card.clearBalls = 6;
    Card.instance = this;
    Card.time = null;
    Card.winMethod = "";
    this.card = [[], [], [], [], []];
} // Card


// --------------------------------------------------
// Class based method of the card class called by the
// user hitting the bingo button to make sure there
// was a valid bingo before asking to start a new
// card or exit.
Card.bingo = function () {

    // If there was a bingo, check to see what is next.
    if (Card.checkBingo())
        Card.won();
}; // bingo

// --------------------------------------------------
// Class based method of card class called by the
// the timer event to draw a number. It also handles
// the game being over by shifting the remaining
// balls off the page or asking the user what is next.
Card.drawBall = function () {

    // If we still can draw another ball, do so.
    var balls = Card.balls.length;
    if (balls < 51) {

        // Update the number of balls remaining. For
        // the 4 balls that can be shifted left, do so.
        document.getElementById("center").innerHTML =
                "" + (50 - balls) + ((balls != 49) ?
                " balls" : " ball");
        for (var i = 0; i < 4; i++) {

            // Clear whatever class the ball might have and
            // give it the class the next ball to the right
            // has.
            document.getElementById("b" + i).classList.
                    remove("b", "i", "n", "g", "o", "h");
            document.getElementById("b" + i).classList.
                    add(document.getElementById("b" + (i + 1)).
                            classList.item(0));

            // Clear whatever class the text might have and
            // give it the class the next to the right has.
            document.getElementById("b" + i + "t").classList.
                    remove("v", "t");
            document.getElementById("b" + i + "t").classList.
                    add(document.getElementById(
                            "b" + (i + 1) + "t").classList.item(0));

            // Copy the text of the right ball over.
            document.getElementById("b" + i + "t").innerHTML =
                    document.getElementById("b" + (i + 1) + "t").
                    innerHTML;
        } // for

        // Get the next unique random ball and the
        // column it beyongs to.
        var ball = Card.nextBall();
        var col = Card.getColumn(ball);

        // Clear the class of the right most ball and
        // set it based on the balls column.
        document.getElementById("b4").classList.
                remove("b", "i", "n", "g", "o", "h");
        document.getElementById("b4").classList.
                add(Card.getClass(col));

        // Clear the class of the right most text and
        // set it to text.
        document.getElementById("b4t").classList.
                remove("v", "t");
        document.getElementById("b4t").classList.
                add("t");

        // If the number is a single digit, set the
        // ball's text to the digit with a leading half
        // space to center it. Otherwise, set the ball's
        // text to the number.
        if (ball < 10)
            document.getElementById("b4t").innerHTML =
                    "\u202f" + ball;
        else
            document.getElementById("b4t").innerHTML = ball;

        // If we are automatically daubing the numbers,
        // do it.
        if (Card.autoDaub) {

            // If the number is on the card, daub it.
            var index =
                    Card.instance.card[col].indexOf(ball);
            if (index >= 0) {

                // Clear the class of the text for the square
                // and set it to verified.
                var obj =
                        document.getElementById("d" + index + col);
                obj.classList.remove("v", "t", "e");
                obj.classList.add("v");

                // If the card has at least one bingo, clear
                // the ball timer and set a timer to handle
                // the win.
                if (Card.checkBingo()) {
                    window.clearTimeout(Card.time);
                    Card.time = window.setInterval(
                            Card.won, 3000);
                } // if
            } // if
        } // if

        // Otherwise, if there is still balls being
        // displayed and we are manually daubing, shift
        // a ball off the page.
    } else if (--Card.clearBalls &&
            !Card.autoDaub) {

        // For the 4 balls that can be shifted left,
        // do so.
        for (var i = 0; i < 4; i++) {

            // Clear whatever class the ball might have and
            // give it the class the next ball to the right
            // has.
            document.getElementById("b" + i).classList.
                    remove("b", "i", "n", "g", "o", "h");
            document.getElementById("b" + i).classList.
                    add(document.getElementById("b" + (i + 1)).
                            classList.item(0));

            // Clear whatever class the text might have and
            // give it the class the next to the right has.
            document.getElementById("b" + i + "t").classList.
                    remove("v", "t");
            document.getElementById("b" + i + "t").classList.
                    add(document.getElementById(
                            "b" + (i + 1) + "t").classList.item(0));

            // Copy the text of the right ball over.
            document.getElementById("b" + i + "t").innerHTML =
                    document.getElementById("b" + (i + 1) + "t").
                    innerHTML;
        } // for

        // Clear the class of the right most ball and
        // set it to hidden.
        document.getElementById("b4").classList.
                remove("b", "i", "n", "g", "o", "h");
        document.getElementById("b4").classList.
                add("h");

        // Clear the class of the right most text and
        // set it to verified so it is invisible.
        document.getElementById("b4t").classList.
                remove("v", "t");
        document.getElementById("b4t").classList.
                add("v");

        // Otherwise, the game is over so clear the timer
        // and ask the user what is next. If they want to
        // play again, set up the next card. Otherwise,
        // thank them for playing.
    } else {
        window.clearTimeout(Card.time);
        if (confirm("Game over. Play again?")) {

            gamesPlayed = gamesPlayed / 1 + 1;
            gamesWon = gamesWon / 1 + 0;

            document.getElementById(('totalGames2')).innerHTML = gamesPlayed;
            document.getElementById(('totalWins2')).innerHTML = gamesWon;

            
            Card.setupCard();
        } else {
           
            gamesPlayed = gamesPlayed / 1 + 1;
            gamesWon = gamesWon / 1 + 0;

            

            document.write(`<body style="background-color: #DBB1BC">
                        <p style="font-size:40px;font-weight:bold;color: #B0FFFF;text-align: center">Thanks for playing.</p>
                        <div style="text-align: center"><form action="/gameOver/${gamesPlayed}/${gamesWon}" method="Post">
                        <input type="submit" style="background-color: #034f84;border: none;color: white;padding: 15px 32px;
                        text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;"
                        value="Sign out" />
                        </form></div></body>`);
            
            onDisconnected();
        }
    } // if
}; // drawBall

// --------------------------------------------------
// Class based method of card class to see if any
// bingos happen. There are 13 ways a bingo can
// happen: 5 rows, 5 columns, \, /, & corners.
Card.checkBingo = function () {

    // Default a bingo found result to no and setup
    // the array of daubs needed to 5's. For each of
    // the squares of the card that are daubed, update
    // the counts and note we won as needed.
    var rsl = false;
    var bingos =
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5];
    var objs = document.getElementsByClassName("v");
    for (var i = 0; i < objs.length; i++) {

        // Get the row and column from the squares id.
        var row = objs[i].id.charAt(1) - '0';
        var col = objs[i].id.charAt(2) - '0';

        // Decrement the array element for this row. If
        // it became zero, we have a bingo so note that
        // and add how to the win method string.
        if (--bingos[row] == 0) {
            rsl = true;
            Card.winMethod += " 'Bingo Across " +
                    (row + 1) + "'";
        } // if

        // Decrement the array element for this column.
        // If it became zero, we have a bingo so note
        // that and add how to the win method string.
        if (--bingos[col + 5] == 0) {
            rsl = true;
            Card.winMethod += " 'Bingo Down " +
                    Card.getClass(col).toUpperCase() + "'";
        } // if

        // Decrement the array element for the diagonal,
        // when the row and column match. If it became
        // zero, we have a bingo so note that and add
        // how to the win method string.
        if (row == col && --bingos[10] == 0) {
            rsl = true;
            Card.winMethod += " 'Bingo \\'";
        } // if

        // Decrement the array element for the reverse
        // diagonal, when the row plus column equals 4.
        // If it became zero, we have a bingo so note
        // that and add how to the win method string.
        if (row + col == 4 && --bingos[11] == 0) {
            rsl = true;
            Card.winMethod += " 'Bingo /'";
        } // if

        // Decrement the array element for the corners,
        // when the row is even and the square is on a
        // diagonal. If it became zero, we have a bingo
        // so note that and add how to the win method
        // string.
        if (row % 2 == 0 && (row == col ||
                row + col == 4) && --bingos[12] == 0) {
            rsl = true;
            Card.winMethod += " 'Bingo Corners'";
        } // if
    }  // for

    // Return the result of a bingo being found.
    return rsl;
}; // checkBingo

// --------------------------------------------------
// Class based method of card class to handle a card
// number being daubbed.
Card.daub = function (obj) {

    // Get the current class of the square. Retrive the
    // number it contains. Verify the number is in the
    // balls that have been called. Remove all possible
    // classes from the square having to do with number
    // color.
    var cls = obj.classList.item(0);
    var num = parseInt(obj.innerHTML);
    var index = Card.balls.indexOf(num);
    obj.classList.remove("v", "t", "e");

    // If the ball was found or the square was
    // incorrectly daubed, toggle it's class by
    // making it verified when it was text or text
    // when it was verified or error. Otherwise,
    // the ball wasn't found so change from text to
    // error.
    if (index >= 0 || cls == "e")
        if (cls == "t")
            obj.classList.add("v");

        else
            obj.classList.add("t");
    else
        obj.classList.add("e");
}; // daub

// --------------------------------------------------
// Class based method of card class to return the
// class type for the column determining the ball
// color.
Card.getClass = function (column) {
    return ["b", "i", "n", "g", "o"][column];
}; // getClass

// --------------------------------------------------
// Class based method of card class to figure out the
// column for the ball number.
Card.getColumn = function (ball) {
    return Math.floor((ball - 1) / 15);
}; // getColumn

// --------------------------------------------------
// Instance based method of card class to select a
// random unique number for the column.
Card.prototype.getNumber = function (column) {

    // Calculate the offset to change the random to
    // a number in this column. Generate a random
    // number within the column. While the number
    // is not unique, try the next one wrapping around.
    // Once a unique ball is found, add it to the
    // card and return it.
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

// --------------------------------------------------
// Class based method of card class to select a
// random unique ball to call.
Card.nextBall = function () {

    // Select a random ball. While the ball has been
    // call, try the next one wrapping around. Once
    // a unique ball is found, add it to the called
    // list and return it.
    var ball = Math.floor(Math.random() * 75) + 1;
    do {
        var i = Card.balls.indexOf(ball);
        if (i >= 0)
            ball = ball % 75 + 1;
    } while (i >= 0);
    Card.balls.push(ball);
    return ball;
}; // nextBall

// --------------------------------------------------
// Instance based method of card class to reset the
// card for the next game by initializing all the
// properties.
Card.prototype.reset = function () {
    Card.autoDaub = false;
    Card.balls = [];
    Card.clearBalls = 6;
    Card.time = null;
    Card.winMethod = "";
    this.card = [[], [], [], [], []];
}; // reset

// --------------------------------------------------
// Class based method of card class to fill in card
// and setup for the next game.
Card.setupCard = function () {

    // Display there's 50 balls left and get the
    // initialized card. If a card doesn't exist,
    // create it. Otherwise, reset the current one.
    document.getElementById("center").innerHTML =
            "50 balls";
    var obj;
    if (Card.instance == null)
        obj = new Card();
    else {
        obj = Card.instance;
        obj.reset();
    } // if

    // Make sure the daub button is ready to turn on
    // automatic daubs. For each column and each row,
    // pick the numbers.
    document.getElementById("daub").value = "auto";
    for (var column = 0; column < 5; column++) {
        for (var row = 0; row < 5; row++) {

            // Get the number for this square. Free square
            // is zero, which needs to be added to the
            // column and called balls. Otherwise, get
            // an unique random number that has already
            // been added to the column.
            var num;
            if (column == 2 && row == 2) {
                num = 0;
                obj.card[column].push(num);
                Card.balls.push(num);
            } else
                num = obj.getNumber(column);

            // Store the number in the square. The single
            // digits get centered by adding a half space.
            var data = document.getElementById(
                    "d" + row + column);
            if (num < 10)
                data.innerHTML = "\u202f" + num;
            else
                data.innerHTML = num;

            // Clear the class of the number and set it to
            // verified so it is daub for the free square.
            // Otherwise, set it to text for all other
            // squares.
            data.classList.remove("t", "v", "e");
            if (num == 0)
                data.classList.add("v");
            else
                data.classList.add("t");
        } // for

        // Clear the class of the ball and set it to
        // hidden.
        document.getElementById("b" + column).classList.
                remove("b", "i", "n", "g", "o");
        document.getElementById("b" + column).classList.
                add("h");

        // Clear the class of the text and set it to
        // verified so it is invisible.
        document.getElementById("b" + column + "t").classList.
                remove("t");
        document.getElementById("b" + column + "t").classList.
                add("v");
    } // for

    // Set up the timer to draw a ball.
    Card.time = window.setInterval(Card.drawBall,
            1000);
}; // setupCard

// --------------------------------------------------
// Class based method of card class to switch between
// manual daub and automatic daub. Toggle the class
// property keeping track of the daub state and
// change the button text to match it's new function.
Card.toggleDaub = function (obj) {
    Card.autoDaub = !Card.autoDaub;
    if (Card.autoDaub)
        obj.value = "manual";
    else
        obj.value = "auto";
}; // toggleDaub

// --------------------------------------------------
// Class based method of card class to state the
// player won and figure out if they wish to play
// again. If yes, set up the next card. Otherwise,
// thank them for playing.
Card.won = function () {

    // Clear the ball timer and figure out what the
    // user wishes to do. If the confirm playing
    // again, setup the next card.
    window.clearTimeout(Card.time);
    if (confirm("You won by" + Card.winMethod +
            ". Play again?")) {

        gamesPlayed = gamesPlayed / 1 + 1;
        gamesWon = gamesWon / 1 + 1;
        document.getElementById(('totalGames2')).innerHTML = gamesPlayed;
        document.getElementById(('totalWins2')).innerHTML = gamesWon;
        Card.setupCard();
    }
    // Otherwise, they are done so say goodbye.
    else {

        gamesPlayed = gamesPlayed / 1 + 1;
        gamesWon = gamesWon / 1 + 1;
       

        document.write(`<body style="background-color: #DBB1BC">
                        <p style="font-size:40px;font-weight:bold;color: #B0FFFF;text-align: center">Thanks for playing.</p>
                        <div style="text-align: center"><form action="/gameOver/${gamesPlayed}/${gamesWon}" method="Post">
                        <input type="submit" style="background-color: #034f84;border: none;color: white;padding: 15px 32px;
                        text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;"
                        value="Sign out" />
                        </form></div></body>`);
        
        onDisconnected();
    }
}; // won
  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
  <title>It's time for BINGO!</title>
  <link rel="stylesheet" href="css/main.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/bingo.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
    integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<body id="section1" >
  <noscript>
    <h2>Sorry! Your browser doesn't support Javascript</h2>
  </noscript>

  <div id="username-page">
    <div class="username-page-container" id="section3">
        <h1 class="title">Welcome, ${u.firstname} ${u.lastname}</h1><br>
        <h2>Games: <span id="totalGames">${u.stats.games}</span>   Wins: <span id="totalWins">${u.stats.wins}</span></h2>
      <form id="usernameForm" name="usernameForm">
        <div class="form-group">
          <div>
            <h2>Your chat name is: <span id="user">${u.username}</span></h2>
          </div>
          <div>
            <h3>Your balance is: ${u.balance} <i class="fas fa-coins" style="color:gold"></i></h3>
          </div>
        </div>
        <div class="form-group">
          <button type="submit" onclick="Card.instance = null;
          Card.setupCard();" class="accent username-submit ">Start
            Playing</button>
        </div>
      </form>

      <form action="/logout" method="Post">
        <input type="submit" class="btn btn-danger" value="Logout" />
      </form>




    </div>
  </div>

  <div id="chat-page" class="hidden">
    <div class="container-fluid">
      <div class="row">

        <div class="col-9">
          <div class="chat-container">
            
      <div class="container center"> <h2>Games: <span id="totalGames2">${u.stats.games}</span>   Wins: <span id="totalWins2">${u.stats.wins}</span></h2>
          <div class="center">
          <svg width="300" height="420">
      
            <rect    x="0"    y="0"   class="b" width="60"
                height="60" />
            <text    x="20"   y="40"  class="t" >B</text>
            <rect    x="0"    y="60"  class="b" width="60"
                height="60" />
            <text    x="15"   y="100" class="t" id="d00"
                onclick="Card.daub(this);">00</text>
            <rect    x="0"    y="120" class="b" width="60"
                height="60" />
            <text    x="15"   y="160" class="t" id="d10"
                onclick="Card.daub(this);">00</text>
            <rect    x="0"    y="180" class="b" width="60"
                height="60" />
            <text    x="15"   y="220" class="t" id="d20"
                onclick="Card.daub(this);">00</text>
            <rect    x="0"    y="240" class="b" width="60"
                height="60" />
            <text    x="15"   y="280" class="t" id="d30"
                onclick="Card.daub(this);">00</text>
            <rect    x="0"    y="300" class="b" width="60"
                height="60" />
            <text    x="15"   y="340" class="t" id="d40"
                onclick="Card.daub(this);">00</text>
            <circle cx="30"  cy="390" class="h" r="30" id="b0" />
            <text    x="15"   y="400" class="v" id="b0t">00</text>
      
            <!-- I column information -->
            <rect    x="60"   y="0"   class="i" width="60"
                height="60" />
            <text    x="80"   y="40"  class="t" >&nbspI</text>
            <rect    x="60"   y="60"  class="i" width="60"
                height="60" />
            <text    x="75"   y="100" class="t" id="d01"
                onclick="Card.daub(this);">00</text>
            <rect    x="60"   y="120" class="i" width="60"
                height="60" />
            <text    x="75"   y="160" class="t" id="d11"
            onclick="Card.daub(this);">00</text>
            <rect    x="60"   y="180" class="i" width="60"
                height="60" />
            <text    x="75"   y="220" class="t" id="d21"
            onclick="Card.daub(this);">00</text>
            <rect    x="60"   y="240" class="i" width="60"
                height="60" />
            <text    x="75"   y="280" class="t" id="d31"
            onclick="Card.daub(this);">00</text>
            <rect    x="60"   y="300" class="i" width="60"
                height="60" />
            <text    x="75"   y="340" class="t" id="d41"
                onclick="Card.daub(this);">00</text>
            <circle cx="90"  cy="390" class="h" id="b1" r="30" />
            <text    x="75"   y="400" class="v" id="b1t">00</text>
      
            <!-- N column information -->
            <rect    x="120"  y="0"   class="n" width="60"
                height="60" />
            <text    x="140"  y="40"  class="t">N</text>
            <rect    x="120"  y="60"  class="n" width="60"
                height="60" />
            <text    x="135"  y="100" class="t" id="d02"
                onclick="Card.daub(this);">00</text>
            <rect    x="120"  y="120" class="n" width="60"
                height="60" />
            <text    x="135"  y="160" class="t" id="d12"
            onclick="Card.daub(this);">00</text>
            <rect    x="120"  y="180" class="n" width="60"
                height="60" />
            <text    x="135"  y="220" class="t" id="d22"
            onclick="Card.daub(this);">00</text>
            <rect    x="120"  y="240" class="n" width="60"
                height="60" />
            <text    x="135"  y="280" class="t" id="d32"
            onclick="Card.daub(this);">00</text>
            <rect    x="120"  y="300" class="n" width="60"
                height="60" />
            <text    x="135"  y="340" class="t" id="d42"
                onclick="Card.daub(this);">00</text>
            <circle cx="150" cy="390" class="h" id="b2" r="30" />
            <text    x="135"  y="400" class="v" id="b2t">00</text>
      
            <!-- G column information -->
            <rect    x="180"  y="0"   class="g" width="60"
                height="60" />
            <text    x="200"  y="40"  class="t">G</text>
            <rect    x="180"  y="60"  class="g" width="60"
                height="60" />
            <text    x="195"  y="100" class="t" id="d03"
                onclick="Card.daub(this);">00</text>
            <rect    x="180"  y="120" class="g" width="60"
                height="60" />
            <text    x="195"  y="160" class="t" id="d13"
            onclick="Card.daub(this);">00</text>
            <rect    x="180"  y="180" class="g" width="60"
                height="60" />
            <text    x="195"  y="220" class="t" id="d23"
            onclick="Card.daub(this);">00</text>
            <rect    x="180"  y="240" class="g" width="60"
                height="60" />
            <text    x="195"  y="280" class="t" id="d33"
            onclick="Card.daub(this);">00</text>
            <rect    x="180"  y="300" class="g" width="60"
                height="60" />
            <text    x="195"  y="340" class="t" id="d43"
                onclick="Card.daub(this);">00</text>
            <circle cx="210" cy="390" class="h" id="b3" r="30" />
            <text    x="195"  y="400" class="v" id="b3t">00</text>
      
            <!-- O column information -->
            <rect    x="240"  y="0"   class="o" width="60"
                height="60" />
            <text    x="260"  y="40"  class="t">O</text>
            <rect    x="240"  y="60"  class="o" width="60"
                height="60" />
            <text    x="255"  y="100" class="t" id="d04"
                onclick="Card.daub(this);">00</text>
            <rect    x="240"  y="120" class="o" width="60"
                height="60" />
            <text    x="255"  y="160" class="t" id="d14"
            onclick="Card.daub(this);">00</text>
            <rect    x="240"  y="180" class="o" width="60"
                height="60" />
            <text    x="255"  y="220" class="t" id="d24"
            onclick="Card.daub(this);">00</text>
            <rect    x="240"  y="240" class="o" width="60"
                height="60" />
            <text    x="255"  y="280" class="t" id="d34"
            onclick="Card.daub(this);">00</text>
            <rect    x="240"  y="300" class="o" width="60"
                height="60" />
            <text    x="255"  y="340" class="t" id="d44"
                onclick="Card.daub(this);">00</text>
            <circle cx="270" cy="390" class="h" id="b4" r="30" />
            <text    x="255"  y="400" class="v" id="b4t">00</text>
          </svg>
      </div>  
      </div>
          <!-- Use a table row to evenly distribute the
               bingo button, the number of balls remaining,
               and the automatic daub button. -->
          <table>
            <tr>
              <td id="left">
                <input type="button" value="BINGO"
                    onclick="Card.bingo();"/>
              </td>
              <td id="center"></td>
              <td id="right">
                <input type="button" value="autodaub" id="daub"
                    onclick="Card.toggleDaub(this);"/>
              </td>
            </tr>
          </table>
          </div>
        </div>
        <div id="col-2">
          <div class="chat-container" id="section2">
            <div class="chat-header">
              <h2>Bingo Global Chat Box</h2>
            </div>
            <div class="connecting">Connecting...</div>
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm" nameform="messageForm">
              <div class="form-group">
                <div class="input-group clearfix">
                  <input type="text" id="message" placeholder="Type a message..." autocomplete="off"
                    class="form-control" />
                  <button type="submit" class="primary">Send</button>
                </div>
              </div>
            </form>


           

          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
  <script src="js/main.js"></script>
  <script src="js/bingo.js"></script>

</body>

</html>
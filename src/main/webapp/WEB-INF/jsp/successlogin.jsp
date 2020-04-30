
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <title>It's time for BINGO!</title>
        <link rel="icon" href="sitecon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="sitecon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="css/main.css"  type="text/css"/>
        <link rel="stylesheet" href="css/style.css"  type="text/css"/>
        <link rel="stylesheet" href="css/bingo.css" type="text/css" />
        <link href="css/slider.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
              integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script
            src="https://www.paypal.com/sdk/js?client-id=AZtEuClm2qhx6CWFk-S7sqq4VkJIG-nwCsK0ko-YNQfuY1ow9uRHsed0_fmgAKHWj11J7bjCaXLdbzSU&disable-funding=credit,card&currency=EUR"> // Required. Replace SB_CLIENT_ID with your sandbox client ID.
        </script>
        <style>

        </style>
    </head>

        <body class="gradient2" >
        <noscript>
        <h2>Sorry! Your browser doesn't support Javascript</h2>
        </noscript>



        <div id="dialogoverlay"></div>
        <div id="dialogbox">
            <div>
                <div id="dialogboxhead"></div>
                <div id="dialogboxbody"></div>
                <div id="dialogboxfoot"></div>
            </div>
        </div>
        <div id="dialogoverlayPaypal"></div>
        <div id="dialogboxPaypal" style="margin-left: 7%">
            <div>
                <div id="dialogboxheadPaypal"></div>
                <div id="dialogboxbodyPaypal"></div>
                <div id="dialogboxfootPaypal"></div>
            </div>
        </div>
        <div id="username-page">

            <div class="username-page-container opacity section3 rounded" style="border-radius: 10%;">

                <h1 class="title">Welcome, ${u.firstname} ${u.lastname}</h1><br>
                <h2>Games: <span id="totalGames">${u.stats.games}</span>   Wins: <span id="totalWins">${u.stats.wins}</span></h2>
                <form id="usernameForm" name="usernameForm">
                    <div class="form-group">
                        <div>
                            <h2>Chat name : <span id="user">${u.username}</span></h2>
                        </div>
                        <div>
                            <h3>Wallet : <span id="balance">${u.balance}</span> &nbsp;<i class="fas fa-coins" style="color:gold"></i></h3>
                        </div>


                        <div>
                            <h3>Choose your starting bet </h3>
                            <input type="range" name="rangeInput" min="0" max="1000" value="0" id="price">  
                            <h3><i class="fas fa-coins" style="color: gold;"></i>&nbsp;<span id="betChosen" ">0</span></h3>


                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" onclick="Card.instance = null;Card.setupCard();" class="accent username-submit">Start
                            Playing</button>
                    </div>
                </form>
                <form>
                   <div class="row">
                       <div class="col-md-8">
                           <h4 style="display: inline"><label>Add funds :</label>&nbsp;<i class="fas fa-euro-sign" style="color: gold;"></i></h4>&nbsp;
                           <input class="form-control" id="paypalDeposit" style="width: 35%; display: inline" type="number" value="0"  min="1" onchange="updatePaypalDeposit()">
                        </div>
                     <div style="margin-top: 1%; margin-right: 5%" id="paypal-button-container" ></div>
                    
                    </div>

                </form><br></br>
                <c:if test="${u.roleID.roleName == 'admin'}">
                    <form id="adminPage" action="/getAllUsers" method="POST" style="float: left">
                        <input type="submit" class="btn btn-secondary" value="Admin Page" />
                    </form>
                </c:if>
                <form id="logoutForm" action="/logoutAdmin" method="POST" style="float: right">
                    <input type="submit" class="btn btn-danger" value="Logout" />
                </form>

            </div>
        </div>

        <div id="chat-page" class="hidden">

            <div class="container-fluid">
                <div class="row mb-4" id="bingobox">

                    <div class="col-5 d-flex justify-content-center" >
                        <div class="chat-container2" >
              
                          
                             <div class="opa"> 

                        
                               
                                
                                    <table class="table table-bordered" >
                                        <thead class="text-xl-center">
                                          <tr>
                                           
                                            <th class="b">B</th>
                                            <th class="i">I</th>
                                            <th class="n">N</th>
                                            <th class="g">G</th>
                                            <th class="o">O</th>
                      
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td>
                                              <button type="button" class="b">
                                                <text class="t" id="d00" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>
                                              <td>
                                                <button type="button" class="i">
                                                  <text class="t" id="d01" onclick="Card.daub(this);">00</text>
                                                </button>
                                              </td>     
                                              <td>
                                                <button type="button" class="n" >
                                                  <text class="t" id="d02" onclick="Card.daub(this);">00</text>
                                                </button>
                                              </td>     
                                              <td>
                                                <button type="button" class="g" >
                                                  <text class="t" id="d03" onclick="Card.daub(this);">00</text>
                                                </button>
                                              </td>     
                                              <td>
                                                <button type="button" class="o"  >
                                                  <text class="t" id="d04" onclick="Card.daub(this);">00</text>
                      
                                                </button>
                                              </td>
                              
                                          </tr>
                                          <tr>
                                              <td>
                                            <button type="button" class="b">
                                              <text class="t" id="d10" onclick="Card.daub(this);">00</text>
                                            </button>
                                          </td>
                                            <td>
                                              <button type="button" class="i">
                                                <text class="t" id="d11" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="n"  >
                                                <text class="t" id="d12" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="g">
                                                <text class="t" id="d13" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="o" >
                                                <text class="t" id="d14" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>
                                          </tr>
                                          <tr>
                                            <td>
                                            <button type="button" class="b">
                                              <text class="t" id="d20" onclick="Card.daub(this);">00</text>
                                            </button>
                                          </td>
                                            <td>
                                              <button type="button" class="i">
                                                <text class="t" id="d21" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>    
                                             <td>
                                              <button type="button" class="n" >
                                                <text class="t" id="d22" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="g">
                                                <text class="t" id="d23" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="o" >
                                                <text class="t" id="d24" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>
                                          </tr>
                                          <tr>
                                            <td>
                                            <button type="button" class="b">
                                              <text class="t" id="d30" onclick="Card.daub(this);">00</text>
                                            </button>
                                          </td>
                                            <td>
                                              <button type="button" class="i">
                                                <text class="t" id="d31" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>    
                                             <td>
                                              <button type="button" class="n" >
                                                <text class="t" id="d32" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="g">
                                                <text class="t" id="d33" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="o" >
                                                <text class="t" id="d34" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>
                                          </tr>
                                          <tr>
                                            <td>
                                            <button type="button" class="b">
                                              <text class="t" id="d40" onclick="Card.daub(this);">00</text>
                                            </button>
                                          </td>
                                            <td>
                                              <button type="button" class="i">
                                                <text class="t" id="d41" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>    
                                             <td>
                                              <button type="button" class="n" >
                                                <text class="t" id="d42" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="g">
                                                <text class="t" id="d43" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>     
                                            <td>
                                              <button type="button" class="o" >
                                                <text class="t" id="d44" onclick="Card.daub(this);">00</text>
                                              </button>
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>

                                    </div>
                                </div>  
                            </div>



                            <!-- Bingo Button -->

                            <div class="col-2 d-flex justify-content-center mt-4">


                                <div class="d-flex align-items-center" >
                                  
                                 <input type="button" class=" red btn-3d " value="BINGO!"  id="bingobutton" onclick="Card.bingo(); "  />
                      
                                 
                                </div>
                                

                                
                              </div>


                               <!-- Chat Container -->

                              <div class="col-5 d-flex justify-content-center" >
                                <div class="d-flex align-items-end">
                                <div class="chat-container opa rounded" >
                      
                                  <div class="chat-header" style="color:black;">
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
        
                <div class="row mt-5 opa" id="menurow">
                    <div class="col-5 d-flex justify-content-center">
            
            
                      
                      <svg width="630" height="200">
                        <circle cx="100" cy="100" class="h" r="50" id="b0" />
                        <circle cx="100" cy="100" r="30" stroke="white" stroke-width="3" fill="none" />
                        <circle cx="100"  cy="100" class="h" r="23" />          
                        <text x="85" y="110" class="v" id="b0t"></text>
            
                        <circle cx="210" cy="100" class="h" id="b1" r="50" />
                        <circle cx="210" cy="100" r="30" stroke="white" stroke-width="3" fill="none" />
                        <circle cx="210"  cy="100" class="h" r="23" />    
                        <text x="195" y="110" class="v" id="b1t"></text>
            
                        <circle cx="320" cy="100" class="h" id="b2" r="50" />
                        <circle cx="320" cy="100" r="30" stroke="white" stroke-width="3" fill="none" />
                        <circle cx="320"  cy="100" class="h" r="23" />    
                        <text x="305" y="110" class="v" id="b2t"></text>
            
            
                        <circle cx="430" cy="100" class="h" id="b3" r="50" />
                        <circle cx="430" cy="100" r="30" stroke="white" stroke-width="3" fill="none" />
                        <circle cx="430"  cy="100" class="h" r="22" />    
                        <text x="415" y="110" class="v" id="b3t"></text>
            
            
                        <circle cx="550" cy="100" class="h" id="b4" r="60" />
                        <circle cx="550" cy="100" r="40" stroke="white" stroke-width="5" fill="none" />
                        <circle cx="550"  cy="100" class="h" r="30" />    
                        <text x="535" y="110" class="v" id="b4t"></text>
            
                      </svg>
            
                      
                    </div>
            
            
            
                    <div class="col-2 d-flex justify-content-center">
            
         
            
            
                      <div class="d-flex align-items-center">
            
                        <span id="center" class="btn btn-lg" style="color: red;"></span>
            
            
                      </div>
    
            
            
            
            
                    </div>
            
                    <div class="col-5 d-flex justify-content-start">
            
                      
            
                      <div class="d-flex align-items-center text-center">
                
            
                        <input type="button" value="Manual" id="daub" class=" btn-3db purple"
                          onclick="Card.toggleDaub(this);" /> </div>
                          
                          <div class="d-flex align-items-center ml-5">
            
                              <h3 style="color: #a0b0ff;">Games: <span id="totalGames2">${u.stats.games}</span>  <br>
                                  Wins: <span id="totalWins2">${u.stats.wins}</span> <br>
                        
                            Wallet : <span id="balanceUpdated">${u.balance}</span> &nbsp;
                            <i class="fas fa-coins" style="color:gold"></i></h3>
                            </div>
            
            
                      
                      

                    </div>
                            
    

            
            
                  </div>
            
                            
                            
         <div class=" col-12 d-flex justify-content-center mt-4">
               <audio controls autoplay="autoplay" loop="loop">
                              <source src="../Solve The Puzzle.ogg" type="audio/ogg">
                             
                              Your browser does not support the audio element.
                            </audio>
                                                </div>
                </div>
              </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/bingo.js"></script>    

    </body>

</html>
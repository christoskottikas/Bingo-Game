<%-- 
    Document   : home
    Created on : 15 Απρ 2020, 1:44:51 μμ
    Author     : Xristos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>It's time for BINGO!</title>
    <link rel="icon" href="sitecon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="sitecon.ico" type="image/x-icon" />
    <link rel="icon" href="img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/3.0.0/css/ionicons.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
  </head>
   <body data-spy="scroll" data-target="#navbar1" data-offset="60">
   
    <div  class="1stSection" id="section1">
        <div class="container h-100" >

            <div class="row h-100">

                <div class="col-12">

                    <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center ">
                      <img class="img-fluid" src="img/homepic.png" alt="Welcome to BINGO">
                        <p class="lead">A game of chance!</p>
                        <div class="row">
                            <div class="col-lg-4 col-sm-6 mx-auto">
                                <div>
                                  
                                  <div>
                                    <a href="#section2" class="btn btn-outline-info1 btn-lg rounded-center " type="button">Tap to Play</a>
                                  </div>
                                </div>
                            </div>
                        </div>
    
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="2ndSection" id="section2">
      <div class="container h-100" >
          <div class="row h-100">
              <div class="col-12">
                  <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center ">
                      <h1 class="display-4">Log In!</h1>
                      <p class="lead">You are just a click away!</p>
                      <div class="row">
                          <div class="col-lg-4 col-sm-6 mx-auto">
                              <div>
                                
                                <div>
                                  <a href="prelogin" class="btn btn-outline-info2 btn-lg rounded-center " type="button">Tap to Login!</a>
                                </div>
                                <br>


                                <p class="lead"> First Time Here? </p>
                                <div>
                                  <a href="#section3" class="btn btn-outline-info2 btn-lg rounded-center " type="button">Tap to Register</a>
                                </div>
                              </div>
                          </div>
                      </div>
  
                  </div>



              </div>
          </div>
      </div>
  </div>



    <div class = "3rdsection" id="section3">
      
        <div class="container h-100" >
            <div class="row h-100">
                <div class="col-12">
                    <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center ">
                        <h1 class="display-4">Register Me!</h1>
                        <p class="lead">Let's get to know each other!</p>
                        <div class="row">
                            <div class="col-lg-4 col-sm-6 mx-auto">
                                <div>
                                  
                                  <div>
                                    <a href="preregister" class="btn btn-outline-info3 btn-lg rounded-center " type="button">Tap to Register!</a>
                                  </div>
                                </div>
                            </div>
                        </div>
    
                    </div>
                </div>
            </div>
        </div>
    </div>







<div id="section4">
          <div class="container h-100" >
            <div class="row h-100">
              <div class="col-12">
                <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center">
                    <h1 class="display-4">About Us!</h1>
                    <p class="lead">What's all the fuss about?</p>
                    <div class="row">
                        <div class="col-lg-4 col-sm-6 mx-auto">
                            <div>
                                <div>
                                    <button class="btn btn-outline-info5 btn-lg rounded-center " type="button" id="showBtn">Tap Here!</button>
                                  </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
            </div>
          </div>
        </div>


        <div id="section5" class="hidden">
            <div class="container h-100" >
              <div class="row h-100">
                <div class="col-12">
                  <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center">
                      <h1 class="display-4">History and Rules of Bingo!</h1>
                      <p class="lead"></p>
                      <div class="row">
                          <div class="col-lg-5 col-sm-5 mx-auto">
                         <p>The game's history can be traced back to 1530, to an Italian lottery called "Lo Giuoco del Lotto D'Italia," which is still played every Saturday in Italy.</p>
                            <p>From Italy, the game was introduced to France in the late 1770s, where it was called "Le Lotto", a game played among wealthy Frenchmen. 
                            The Germans also played a version of the game in the 1800s, but they used it as a child's game to help students learn math, spelling, and history.​</p>

                           <p>In the U.S., bingo was originally called "beano". It was a country fair game where a dealer would select numbered discs from a cigar box and players would mark their cards with beans. 
                            They yelled "beano" if they won. </p>
                  </div>

                  <div class="col-lg-2 col-sm-2 mx-auto">
                          
                  </div>
                  <div class="col-lg-5 col-sm-5 mx-auto">
                          <p>A typical Bingo game utilizes the numbers 1 through 75. The five columns of the card are labeled 'B', 'I', 'N', 'G', and 'O' from left to right. The center space is usually marked "Free" or "Free Space", and is considered automatically filled.</p>
                          <p> The range of printed numbers that can appear on the card is normally restricted by column. </p>
                        <p>
                            So the 'B' column only containing numbers between 1 and 15 inclusive, the 'I' column containing only 16 through 30, 'N' containing 31 through 45, 'G' containing 46 through 60, and 'O' containing 61 through 75.</p>
                    <p> A player wins by completing a row, column, or diagonal and of course pressing the "BINGO" button!</p>
                 
                        </div>

 </div>
                              <div><a href="#section1" class="btn btn-outline-info6 btn-lg rounded-center " type="button" id="hideBtn">Back to main Menu</a></div>
                         
                    
                     
                  </div>
              </div>
              </div>
            </div>
          </div>
    

               
               

        <footer id="footer" class="bg-dark text-light py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-12 col-md-12 col-lg-6 mb-2">
                    <h6 class="text-uppercase">Created By:</h6>
                    <ul class="nav flex-column">
                        <li><a class="text-white" target="ext" rel="nofollow" href="https://github.com/mariosgitk">Kykkos M.</a></li>
                        <li><a class="text-white" target="ext" rel="nofollow" href="https://github.com/christoskottikas">Kottikas C.</a></li>
                        <li><a class="text-white" target="ext" rel="nofollow" href="https://github.com/KonAndreadis">Andreadis K.</a></li>
                        <li><a class="text-white" target="ext" rel="nofollow" href="https://github.com/ChrisPap85">Papachristos C.</a></li>
                    </ul>
                </div>

                <div class="col-12 col-md-12 col-lg-6 mb-2 text-right">
                    <h6 class="text-uppercase">Follow Us</h6>
                    <ul class="nav float-right">
                        <li><a class="text-white mr-2" rel="nofollow" href="https://twitter.com/_bingogame?lang=el" title="Follow on Twitter"><i class="h1 fa fa-fw fa-twitter fa-2x ion-logo-twitter"></i></a></li>
                        <li><a class="text-white mr-2" rel="nofollow" href="https://www.facebook.com/playbingo/" title="Follow on Facebook"><i class="h1 fa fa-fw fa-facebook fa-2x ion-logo-facebook"></i></a></li>
                        <li><a class="text-white mr" rel="nofollow" href="https://github.com/mariosgitk/BingoApp" title="Follow on GitHub"><i class="h1 fa fa-fw fa-facebook fa-2x ion-logo-github"></i></a></li>

                    </ul>
                </div>
            </div>
           
        </div>
    </footer>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    


    <script>


var sect4 = document.querySelector("#section4");
var sect5 = document.querySelector("#section5");


$(document).ready(function(){
  $("#showBtn").click(function(){
   sect4.classList.add('hidden');
   sect5.classList.remove('hidden');
  });
  $("#hideBtn").click(function(){
    sect5.classList.add('hidden');
   sect4.classList.remove('hidden');
  });
});

    </script>
</body>
</html> 

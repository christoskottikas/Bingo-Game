var mail = document.querySelector('#mail').innerHTML;
document.querySelector('#reg').addEventListener('click', () => {
    
    var data = JSON.stringify({
        name: "BingoMail",
        from: "bingoapplic@gmail.com",
        to: mail,
        subject: "Notification"
    });
   
    $.ajax({
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        url: '/sendingEmail',
        type: 'POST',
        data: data,
        dataType: 'json'
    });
 
});


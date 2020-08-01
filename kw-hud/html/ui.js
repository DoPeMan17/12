$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;

        $(".container").css("display",data.show? "none":"block");
        $('.car').css('display', data.car ? "block" : "none")

        $('#voice').css("width", data.voice + '%');
        if (data.voice < 75) {
            $('#voice').css("color", 'red');
        } else if (data.voice < 50) {
            $('#voice').css("color", '#f0584d');
        } else if (data.voice < 25) {
            $('#voice').css("color", 'white');
        } else {
            $('#voice').css("color", 'green');
        }

        $('#money').text(data.cash);

        $('#hunger').css("width", data.hunger + '%');   
        $('#hunger2').css("width", data.hunger + '%'); 
        $('#hunger2').css("background-color", "rgba(255, 0, 0, " + (100 - data.hunger) + "%)"); 

        $('#thirst').css("width", data.thirst + '%');   
        $('#thirst2').css("width", data.thirst + '%'); 
        $('#thirst2').css("background-color", "rgba(255, 0, 0, " + (100 -  data.thirst) + "%)");

        if (data.car) {
            $('.speed').text(data.speed + ' km/h')
            $('#benzin').css("width", data.fuel + "%")
        } else {
            $('.speed').text('0 km/h')
            $('#benzin').css("width", "100%")
        }
    });
});
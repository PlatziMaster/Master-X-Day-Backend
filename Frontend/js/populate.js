$(document).ready(function () { 
        $.ajax({url: "http://api.aeroplatzis.com/api/v1/countries", success: function(result){
            var ans = result.data["attributes"];
            
            ans.forEach(element => {
                var country_id = element.id;
                var country_name = element.name;
                var opt = new Option(country_name, country_id);
                $("#destination_country, #origin_country ").append(opt);
            });
        }})

        $('#destination_country').change(function(){ 
                $('#destination_city').empty();
                var id = $(this).val();
                $.ajax({url: "http://api.aeroplatzis.com/api/v1/cities?country=" + id, success: function(result){
                var ans = result.data["attributes"];
            
                ans.forEach(element => {
                    var city_id = element.id;
                    var city_name = element.name;
                    var opt = new Option(city_name, city_id);
                    $("#destination_city").append(opt);
                });
            }})
        });

        $('#origin_country').change(function(){ 
            $('#origin_city').empty();
            var id = $(this).val();
            $.ajax({url: "http://api.aeroplatzis.com/api/v1/cities?country=" + id, success: function(result){
            var ans = result.data["attributes"];
        
            ans.forEach(element => {
                var city_id = element.id;
                var city_name = element.name;
                var opt = new Option(city_name, city_id);
                $("#origin_city").append(opt);
            });
        }})
    });

    $('#destination_city').change(function(){ 
        $('#destination_airport').empty();
        var id = $(this).val();
        $.ajax({url: "http://api.aeroplatzis.com/api/v1/airports?country=" + id, success: function(result){
        var ans = result.data["attributes"];
    
        ans.forEach(element => {
            var airport_id = element.id;
            var airport_name = element.name;
            var opt = new Option(airport_name, airport_id);
            $("#destination_airport").append(opt);
        });
    }})
});

$('#destination_city').change(function(){ 
    $('#origin_airport').empty();
    var id = $(this).val();
    $.ajax({url: "http://api.aeroplatzis.com/api/v1/airports?country=" + id, success: function(result){
    var ans = result.data["attributes"];

    ans.forEach(element => {
        var airport_id = element.id;
        var airport_name = element.name;
        var opt = new Option(airport_name, airport_id);
        $("#origin_airport").append(opt);
    });
}})
});

});
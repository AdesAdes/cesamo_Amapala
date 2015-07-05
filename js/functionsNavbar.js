$(document).ready(function() {
    // Evento dado para el módulo de recepción
    $("#reception").click(function(event) {
        event.preventDefault(); 
        $("#principalContainer").load("pages-modules/reception/principal.php?content=reception" );
    });
    // Evento dado para el botón home
    $("#home").click(function(event) {
        event.preventDefault();
        $("#principalContainer" ).load("pages-modules/home.php?content=home");
    });
    // Evento dado para el módulo de médicos
    $("#medical").click(function(event) {
        event.preventDefault();
        $("#principalContainer" ).load("pages-modules/medical_consultations/principal.php?content=medical" );
    });
    // Evento dado para el módulo del usuario
    $("#user").click(function(event) {
        event.preventDefault();
        $("#principalContainer" ).load("pages-modules/user/principal.php?content=user" );
    });
    // Evento dado para el módulo administrativo
    $("#admin").click(function(event) {
        event.preventDefault();
        $("#principalContainer" ).load("pages-modules/administration/principal.php?content=admin" );
    });
    $("#adminnv").click(function(event) {
        event.preventDefault();
        $("#principalContainer" ).load("pages-modules/administration/principal.php?content=admin" );
    }); 
}); 


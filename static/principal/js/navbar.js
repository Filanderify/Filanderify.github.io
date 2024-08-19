document.getElementById('servicios-link').addEventListener('click', function(event) {
    event.preventDefault(); // Evitar que el enlace recargue la página
    var dropdown = this.parentElement;
    var isActive = dropdown.classList.contains('active');
    
    // Ocultar todos los dropdowns
    var allDropdowns = document.querySelectorAll('.dropdown');
    allDropdowns.forEach(function(dd) {
        dd.classList.remove('active');
    });

    // Mostrar el dropdown si no estaba activo
    if (!isActive) {
        dropdown.classList.add('active');
    }
});

// Cerrar el dropdown si se hace clic fuera de él
window.onclick = function(event) {
    if (!event.target.matches('#servicios-link') && !event.target.closest('.dropdown')) {
        var dropdowns = document.querySelectorAll('.dropdown');
        dropdowns.forEach(function(dd) {
            dd.classList.remove('active');
        });
    }
}
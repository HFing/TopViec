window.addEventListener('DOMContentLoaded', event => {
    console.log('DOM fully loaded and parsed');

    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        console.log('Initializing Simple-DataTables');
        new simpleDatatables.DataTable(datatablesSimple);
    } else {
        console.error('Element with ID "datatablesSimple" not found');
    }
});
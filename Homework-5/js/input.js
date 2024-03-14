document.getElementById('carInputForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const make = document.getElementById('inputMake').value.trim();
    const model = document.getElementById('inputModel').value.trim();
    const year = parseInt(document.getElementById('inputYear').value, 10);

    if (!make || !model || isNaN(year)) {
        alert('Please ensure all fields are filled in correctly.');
        return;
    }

    addCarToDatabase(make, model, year);

    alert('Car added successfully!');
    document.getElementById('carInputForm').reset();
});
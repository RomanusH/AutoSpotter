var navbar_middle = document.getElementById("navbar-decoration");

window.addEventListener('scroll', function () {
    if (window.scrollY > 60) {
        navbar_middle.style.width = '0';
    }
    else {
        navbar_middle.style.width = '15rem';
    }
});

function populateDropdowns() {
    const makes = [...new Set(carDatabase.map(car => car.make))];
    const makeDropdown = document.getElementById("make");

    makes.forEach(make => {
        const option = document.createElement("option");
        option.value = make;
        option.text = make;
        makeDropdown.appendChild(option);
    });
}

function updateModels() {
    const selectedMake = document.getElementById("make").value;
    const models = [...new Set(carDatabase.filter(car => car.make === selectedMake).map(car => car.model))];
    const modelDropdown = document.getElementById("model");
    modelDropdown.innerHTML = '<option value="" disabled selected>Select Model</option>';

    models.forEach(model => {
        const option = document.createElement("option");
        option.value = model;
        option.text = model;
        modelDropdown.appendChild(option);
    });
}

function updateYears() {
    const selectedMake = document.getElementById("make").value;
    const selectedModel = document.getElementById("model").value;
    const years = [...new Set(carDatabase.filter(car => car.make === selectedMake && car.model === selectedModel).map(car => car.year))];
    const yearDropdown = document.getElementById("year");
    yearDropdown.innerHTML = '<option value="" disabled selected>Select Year</option>';

    years.forEach(year => {
        const option = document.createElement("option");
        option.value = year;
        option.text = year;
        yearDropdown.appendChild(option);
    });
}

function searchCar() {
    const selectedMake = document.getElementById("make").value;
    const selectedModel = document.getElementById("model").value;
    const selectedYear = parseInt(document.getElementById("year").value);  // Convert string to integer

    if (selectedMake && selectedModel && selectedYear) {
        const selectedCar = carDatabase.find(car => car.make === selectedMake && car.model === selectedModel && car.year === selectedYear);

        if (selectedCar) {
            const result = `
          <img src="${selectedCar.imgSrc}" alt="Car Image">
          <div>
            <p><strong>Make:</strong> ${selectedCar.make}</p>
            <p><strong>Model:</strong> ${selectedCar.model}</p>
            <p><strong>Year:</strong> ${selectedCar.year}</p>
            <p><strong>Engine Type:</strong> ${selectedCar.engineType}</p>
            <p><strong>Engine:</strong> ${selectedCar.engine}</p>
          </div>
        `;
            document.getElementById("result").innerHTML = result;
        } else {
            document.getElementById("result").innerHTML = "<h3>No matching car found!</h3>";
        }
    } else {
        document.getElementById("result").innerHTML = "<h3>Please select all fields!</h3>";
    }
}


populateDropdowns();

document.getElementById("make").addEventListener("change", updateModels);
document.getElementById("model").addEventListener("change", updateYears);
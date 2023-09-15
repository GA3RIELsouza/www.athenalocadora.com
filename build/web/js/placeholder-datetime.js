function placeholderDatetime() {
    const inputs = document.querySelectorAll('input[type="datetime-local"]');   

    inputs.forEach(input => {
        if(isNaN(input.valueAsNumber)) {
            input.classList.add("placeholder-datetime");
        }else {
            input.classList.remove("placeholder-datetime");
        }
    });
}

function resetPlaceholder() {
    const inputs = document.querySelectorAll('input[type="datetime-local"]');   

    inputs.forEach(input => {
        if(input.defaultValue === "") {
            input.classList.add("placeholder-datetime");
        }else {
            input.classList.remove("placeholder-datetime");
        }
    });
}

document.addEventListener("DOMContentLoaded", function() {
    placeholderDatetime();
});
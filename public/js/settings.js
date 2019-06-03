window.onload = function()
{
    document.querySelector("input[name = 'birth_date']").setAttribute("max", getCurrentDate());
};

function getCurrentDate()
{
    let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    let yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    
    return today;
}

function confirmPassword()
{
    let password_input = document.querySelector("input[name = 'password']");
    let password_confirm_input = document.querySelector("input[name = 'password_confirm']");
    
    if(password_input.value != password_confirm_input.value)
    {
        let warning = document.createElement("p");

        warning.innerText = "    Passwords don't match!";
        warning.setAttribute("style", "color: #af1c1c;")
        password_confirm_input.parentElement.appendChild(warning);

        return false;
    }
    else
        return true;
}
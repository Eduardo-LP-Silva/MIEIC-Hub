window.onload = function()
{
    setAspectRatio();
    setFilterListener();
}

function setAspectRatio()
{
    let cols = document.querySelectorAll(".results_container");

    for(let i = 0; i < cols.length; i++)
    {
        cols[i].style.height = "" + cols[i].clientWidth + "px";
    }
}

function setFilterListener()
{
    let dropdownItems = document.querySelectorAll("#search_parameters .dropdown-item");

    for(let i = 0; i < dropdownItems.length; i++)
        dropdownItems[i].addEventListener("click", function(event)
        {
            event.preventDefault();
            
            let filter = document.querySelector("#search_parameters > .dropdown > span");

            filter.textContent = dropdownItems[i].textContent;

        });
}
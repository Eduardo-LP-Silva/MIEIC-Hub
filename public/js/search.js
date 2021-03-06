window.onload = function()
{
    setAspectRatio();
    setFilterListener();
    setBanListeners();
    calcRatings();
}

function calcRatings() {
    let ratings = document.querySelectorAll(".stars-inner");
    
    for(let i=0; i<ratings.length; i++) {
        let productRating = ratings[i].getAttribute("data-rating");
        productRating = productRating * 100 / 5;
        ratings[i].style.width = productRating + "%";
    }

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
        dropdownItems[i].addEventListener("click", function()
        {            
            let filter = document.querySelector("#search_parameters > .dropdown > span");

            filter.textContent = dropdownItems[i].textContent;
        });
}

function setBanListeners()
{
    let banBtn = document.querySelectorAll(".list-item > button");

    for(let i = 0; i < banBtn.length; i++)
        banBtn[i].addEventListener("click", function(event)
        {
            event.preventDefault();

            let data = {"name": banBtn[i].getAttribute("name")};
            let request = new XMLHttpRequest();

            request.open("DELETE", "/users/" + banBtn[i].getAttribute("name") + "/delete", true);
            request.setRequestHeader('X-CSRF-TOKEN', document.getElementById("search").getAttribute("data-token"));
            request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

            request.addEventListener('load', function()
            {
                let list = banBtn[i].parentElement.parentElement.parentElement;

                list.removeChild(banBtn[i].parentElement.parentElement);
            });

            request.send(JSON.stringify(data));
        });
}
window.onload = function()
{
    addRemoveListeners();
    updateFinalPrice();
}

function addRemoveListeners()
{
    let removeBtns = document.querySelectorAll(".list-item > i");
    let list = document.querySelector("#list");

    for(let i = 0; i < removeBtns.length; i++)
        removeBtns[i].addEventListener("click", function(event)
        {
            event.preventDefault();
            list.removeChild(removeBtns[i].parentNode);
            updateFinalPrice();
        });
}

function updateFinalPrice()
{

    let finalPrice = 0, items = document.querySelectorAll(".list-item");

    for(let i = 0; i < items.length; i++)
        finalPrice += parseFloat(items[i].querySelector("span:nth-child(5)").textContent);

    let finalPriceElement = document.querySelector("#list > div:last-child > span");

    finalPriceElement.textContent = "Total: " + finalPrice + "€";

    ajaxDeleteCartEntry();

}

function ajaxDeleteCartEntry()
{

    let item = document.querySelector("#item");

    let id_user = item.getAttribute("id_user");

    let id_product = item.getAttribute("id_product");

    let request = new XMLHttpRequest();
    request.open("DELETE", "/users/" + id_user + "/cart/" + id_product + "/remove", true);
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    console.log("token : " + item.getAttribute("token"));
    request.setRequestHeader('X-CSRF-TOKEN', item.getAttribute("token"));

    //request.addEventListener("load", function () {
    //    refresh();
    //})  
    
    request.send(JSON.stringify({"id_user": id_user, "id_product": id_product}));

}
window.onload = function()
{
    addRemoveListeners();
    updateFinalPrice();
}

function addRemoveListeners()
{
    let removeBtns = document.querySelectorAll(".list-item > i");

    for(let i = 0; i < removeBtns.length; i++)
        removeBtns[i].addEventListener("click", function() {
            event.preventDefault();
            ajaxDeleteCartEntry(removeBtns[i].parentNode);
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

}

function ajaxDeleteCartEntry(btn)
{

    let id_user = btn.getAttribute("id_user");

    let id_product = btn.getAttribute("id_product");

    console.log(id_user);
    console.log(id_product);

    let request = new XMLHttpRequest();
    request.open("DELETE", "/users/" + id_user + "/cart/" + id_product + "/remove", true);
    request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    console.log("token : " + btn.getAttribute("token"));
    request.setRequestHeader('X-CSRF-TOKEN', btn.getAttribute("token"));

    //request.addEventListener("load", function () {
    //    refresh();
    //})  
    
    request.send(JSON.stringify({"id_user": id_user, "id_product": id_product}));

}
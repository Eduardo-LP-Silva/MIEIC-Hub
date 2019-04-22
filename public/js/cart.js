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
}
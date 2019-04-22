window.onload = function()
{
    addRemoveListeners();
}

function addRemoveListeners()
{
    let removeBtns = document.querySelectorAll(".list-item > i");
    let list = document.querySelector("#list");

    for(let i = 0; i < removeBtns.length; i++)
        removeBtns[i].addEventListener("click", function(event)
        {
            list.removeChild(removeBtns[i].parentNode);
            event.preventDefault();
        });
}
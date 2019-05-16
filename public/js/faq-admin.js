window.onload = function()
{
    addTrashListeners();
}

function addTrashListeners()
{
    let trashCans = document.querySelectorAll("#accordionExample i");

    for(let i = 0; i < trashCans.length; i++)
        trashCans[i].addEventListener("click", function()
        {
            let card = trashCans[i].parentNode.parentNode.parentNode;

            card.parentNode.removeChild(card);
        });
}
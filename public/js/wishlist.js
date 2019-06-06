window.onload = function() {
    addRemoveListeners();
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
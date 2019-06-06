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
        removeBtns[i].addEventListener("click", function(event) {
            let id = removeBtns[i].parentNode.getAttribute("data-id");
            let token = list.getAttribute("data-token");
            let request = new XMLHttpRequest();
            request.open("DELETE", '/wishlist/' + id + '/delete/', true);

            request.addEventListener('load', function() {
                list.removeChild(removeBtns[i].parentNode);
                event.preventDefault();
            });
            request.setRequestHeader('X-CSRF-TOKEN', token);
            request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
            request.send();
        });
}
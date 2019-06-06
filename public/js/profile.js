window.onload = function() {
    calcRating();
}

function calcRating() 
{
    let ratings = document.querySelectorAll(".stars-inner");
    
    for(let i=0; i<ratings.length; i++) 
    {
        let productRating = ratings[i].getAttribute("data-rating");
        productRating = productRating * 100 / 5;
        ratings[i].style.width = productRating + "%";
    }
}
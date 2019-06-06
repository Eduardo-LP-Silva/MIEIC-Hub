window.onload = function() {
    addHeartListener();
    addStarsListeners();
    addSizeListener();
    //addColorListener();
    addDeleteListener();

    lockOneSize();
    calcRating();
}

function addDeleteListener() {
    let btn = document.querySelector("#delete-product");

    btn.addEventListener("click", function() {
        let id = document.querySelector("div#content").getAttribute("data-id");
        let token = document.querySelector("div#content").getAttribute("data-token");
        let request = new XMLHttpRequest();
        request.open("DELETE", '/products/' + id + '/delete/', true);
        request.setRequestHeader('X-CSRF-TOKEN', token);
        request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

        request.addEventListener('load', function() {
            console.log(request.responseText);
        });

        request.send();
    });
}

function lockOneSize() {
    let buttons = document.querySelectorAll("div#content div#info .btn-group button");
    if(buttons[0].innerHTML == 'One-Size') {
        buttons[0].style.backgroundColor = "#af1c1c";
    }
}

function calcRating() {
    let rating = document.querySelector(".stars-inner");
    let productRating = rating.getAttribute("data-rating");
    productRating = productRating * 100 / 5;
    rating.style.width = productRating + "%";
}


function addHeartListener()
{
    let heart = document.querySelector(".heart");

    heart.addEventListener("click", function() {
        let id = document.querySelector("div#content").getAttribute("data-id");
        let token = document.querySelector("div#content").getAttribute("data-token");
        let request = new XMLHttpRequest();

        if(heart.classList.contains("far")) {
            // Add to wishlist
            request.open("PUT", '/wishlist/' + id + '/add/', true);

            request.addEventListener('load', function() {
                heart.classList.remove("far");
                heart.classList.add("fa");
            });
        }
        else {
            // Remove from wishlist
            request.open("DELETE", '/wishlist/' + id + '/delete/', true);

            request.addEventListener('load', function() {
                heart.classList.remove("fa");
                heart.classList.add("far");
            });
        }

        request.setRequestHeader('X-CSRF-TOKEN', token);
        request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
        request.send();
    });
}

function addStarsListeners() {
    let stars = document.querySelectorAll("div#reviews div#add span.fa-star");

    for(let i=0; i<stars.length;i++) {
        stars[i].addEventListener("click", function() {
            let nextStar = stars[i].nextElementSibling;
            while(nextStar != null) {
                nextStar.classList.remove("checked");
                nextStar = nextStar.nextElementSibling;
            }

            stars[i].classList.add("checked");
            let previousStar = stars[i].previousElementSibling;
            while( previousStar != null) {
                previousStar.classList.add("checked");
                previousStar = previousStar.previousElementSibling;
            }
        });
    }
}

function addColorListener()
{

    let select = document.querySelector("#color > select");
    select.addEventListener("change", function()
        {
            // FORM
            document.querySelector("#colorinput").setAttribute('value', select.querySelector("option").getAttribute('value'));
        });

}

function addSizeListener()
{
    let buttons = document.querySelectorAll("div#content div#info .btn-group button");

    for(let i = 0; i < buttons.length; i++)
        buttons[i].addEventListener("click", function()
        {
            for(let j = 0; j < buttons.length; j++) {
                if(buttons[j].style.backgroundColor == "rgb(175, 28, 28)" && buttons[j] != buttons[i])
                    buttons[j].style.backgroundColor = "black";
            }

            buttons[i].style.backgroundColor = "#af1c1c";

            // FORM
            document.querySelector("#sizeinput").setAttribute('value', buttons[i].textContent);

        });

}
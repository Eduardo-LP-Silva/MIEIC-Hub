window.onload = function() {
    addHeartListener();
    addStarsListeners();
}


function addHeartListener()
{
    let heart = document.querySelector(".heart");

    heart.addEventListener("click", function() {
        //Change condition to sync with db

        if(heart.getAttribute("src") == "../resources/icons/heart_empty.svg")
        {
            heart.setAttribute("src", "../resources/icons/heart_full.svg");
        } 
        else
        {
            heart.setAttribute("src", "../resources/icons/heart_empty.svg");
        } 
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
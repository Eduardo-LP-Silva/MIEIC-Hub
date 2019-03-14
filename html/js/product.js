window.onload = function() {
    addHeartListener();
    addStarsListeners();
}


function addHeartListener()
{
    let heart = document.querySelector(".heart");

    heart.addEventListener("click", function() 
    {
        //Change condition to sync with db

        if(heart.classList.contains("far"))
        {
            heart.classList.remove("far");
            heart.classList.add("fa");
        }
        else 
        {
            heart.classList.remove("fa");
            heart.classList.add("far");
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
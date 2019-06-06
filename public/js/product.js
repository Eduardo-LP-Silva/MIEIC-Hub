window.onload = function() {
    addHeartListener();
    addStarsListeners();
    addSizeListener();

    let buttons = document.querySelectorAll("div#content div#info .btn-group button");
    if(buttons[0].innerHTML == 'One-Size') {
        buttons[0].style.backgroundColor = "#af1c1c";
    }
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
        });
}
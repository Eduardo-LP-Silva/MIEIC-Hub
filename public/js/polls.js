window.onload = function()
{
    setAspectRatio();
    addHeartListeners();
    setModals();
}

window.onresize = function()
{
    setAspectRatio();
}

function setAspectRatio()
{
    let cols = document.querySelectorAll(".design_container");

    for(let i = 0; i < cols.length; i++)
    {
        cols[i].style.height = "" + cols[i].clientWidth + "px";
    }
}

function addHeartListeners()
{
    let hearts = document.querySelectorAll(".heart");
    
    for(let i = 0; i < hearts.length; i++)
        hearts[i].addEventListener("click", function()
        {
            let newVotesNo;
            let request = new XMLHttpRequest();
            let url = "/users/" + document.getElementById("user").getAttribute("name") + "/vote/"
                + hearts[i].parentElement.getAttribute("poll");

            if(hearts[i].classList.contains("far"))
            {
                request.open("PUT", "/users/" + banBtn[i].getAttribute("name") + "/delete", true);
                hearts[i].classList.remove("far");
                hearts[i].classList.add("fa");

                newVotesNo = parseInt(hearts[i].nextElementSibling.textContent) + 1;
                hearts[i].nextElementSibling.textContent = newVotesNo;
                hearts[i].parentElement.style.borderColor = "#af1c1c";
            } 
            else
            {
                hearts[i].classList.remove("fa");
                hearts[i].classList.add("far");

                newVotesNo = parseInt(hearts[i].nextElementSibling.textContent) - 1;
                hearts[i].nextElementSibling.textContent = newVotesNo;
                hearts[i].parentElement.style.borderColor = "#969696";
            } 
        });
}

function setModals()
{
    let containers = document.querySelectorAll(".design_container");

    for(let i = 0; i < containers.length; i++)
    {
        let imgSmall = containers[i].children[2];
        let modal = document.createElement("div");
        let imgBig = document.createElement("img");

        modal.classList.add("modal");
        imgBig.setAttribute("alt", containers[i].parentElement.lastElementChild.textContent);
        imgBig.classList.add("modal-content");

        imgSmall.addEventListener("click", function()
        {
            modal.style.display = "block";
            imgBig.setAttribute("src", this.getAttribute("src"));
            
            modal.appendChild(imgBig);
            document.body.appendChild(modal);
        });

        imgBig.addEventListener("click", function()
        {
            document.body.removeChild(modal);
        });

        modal.addEventListener("click", function()
        {
            document.body.removeChild(modal);
        });
    }
}


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
    let token = document.getElementById("main").getAttribute("data-token");
    let name = document.getElementById("main").getAttribute("name");
    
    for(let i = 0; i < hearts.length; i++)
        hearts[i].addEventListener("click", function()
        {
            let newVotesNo;
            let sub = hearts[i].parentElement.getAttribute("data-sub");
            let data = {"name": name, "id_sub": sub};
            let request = new XMLHttpRequest();
            let url = "/users/" + name + "/vote/" + sub;

            if(hearts[i].classList.contains("far"))
            {
                request.open("PUT", url, true);
                request.setRequestHeader('X-CSRF-TOKEN', token);
                request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

                request.onload = function()
                {
                    if(request.responseText == 200)
                    {
                        hearts[i].classList.remove("far");
                        hearts[i].classList.add("fa");
        
                        newVotesNo = parseInt(hearts[i].nextElementSibling.textContent) + 1;
                        hearts[i].nextElementSibling.textContent = newVotesNo;
                    }
                }

                request.send(JSON.stringify(data));
            } 
            else
            {
                request.open("DELETE", url, true);
                request.setRequestHeader('X-CSRF-TOKEN', token);
                request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

                request.onload = function()
                {
                    if(request.responseText == 200)
                    {
                        hearts[i].classList.remove("fa");
                        hearts[i].classList.add("far");

                        newVotesNo = parseInt(hearts[i].nextElementSibling.textContent) - 1;
                        hearts[i].nextElementSibling.textContent = newVotesNo;
                    }
                }

                request.send(JSON.stringify(data));
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


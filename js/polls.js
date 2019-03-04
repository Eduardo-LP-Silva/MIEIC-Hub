window.onload = function()
{
    setAspectRatio();
}

window.onresize = function()
{
    setAspectRatio();
}

function setAspectRatio()
{
    let cols = document.querySelectorAll(".poll .col");

    for(let i = 0; i < cols.length; i++)
    {
        cols[i].style.height = "" + cols[i].clientWidth + "px";
    }
}
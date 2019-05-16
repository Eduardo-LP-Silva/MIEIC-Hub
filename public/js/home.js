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
    let cols = document.querySelectorAll(".grid_container");

    for(let i = 0; i < cols.length; i++)
    {
        cols[i].style.height = "" + cols[i].clientWidth + "px";
    }
}
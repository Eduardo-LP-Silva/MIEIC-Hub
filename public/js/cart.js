window.onload = function()
{
    addRemoveListeners();
    updateFinalPrice();
}

function addRemoveListeners()
{
    let removeBtns = document.querySelectorAll(".list-item > i");

    for(let i = 0; i < removeBtns.length; i++)
        removeBtns[i].addEventListener("click", function() {
            event.preventDefault();
            removeChild(removeBtns[i]);
            ajaxDeleteCartEntry(removeBtns[i].parentNode);
            updateFinalPrice();
        });
}

function removeChild(btn) {

    console.log("quantity" + btn.parentNode.getAttribute('quantity') + "\n");

    if(btn.parentNode.getAttribute('quantity') == 1){
        console.log("removing child");
        list.removeChild(btn.parentNode);
    } else {
        btn.parentNode.setAttribute('quantity', btn.parentNode.getAttribute('quantity') - 1);
        btn.parentNode.querySelector('#itemquantity').textContent = btn.parentNode.querySelector('#itemquantity').textContent-1;
        console.log(btn.parentNode.getAttribute('quantity') - 1);
    }

}

function updateFinalPrice()
{

    let finalPrice = 0, items = document.querySelectorAll(".list-item");

    for(let i = 0; i < items.length; i++)
        finalPrice += (parseFloat(items[i].querySelector("#itemprice").textContent) * items[i].getAttribute('quantity'));

    let finalPriceElement = document.querySelector("#totalprice");

    finalPriceElement.textContent = "Total: " + finalPrice + "€";

}

function ajaxDeleteCartEntry(btn)
{

    let id_user = btn.getAttribute("id_user");

    let id_product = btn.getAttribute("id_product");

    console.log("user" + id_user);
    console.log("product" + id_product);

    let request = new XMLHttpRequest();
    request.open("DELETE", "/users/" + id_user + "/cart/" + id_product + "/remove", true);
    request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    //console.log("token : " + btn.getAttribute("token"));
    request.setRequestHeader('X-CSRF-TOKEN', btn.getAttribute("token"));

    //request.addEventListener("load", function () {
    //    refresh();
    //})  
    
    request.send(JSON.stringify({"id_user": id_user, "id_product": id_product}));

}
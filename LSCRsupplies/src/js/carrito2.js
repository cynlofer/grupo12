const addToShoppingCarButtons = document.querySelectorAll(".fa-plus");
const restToShoppingCarButtons = document.querySelectorAll(".fa-minus");
const subTotal = document.querySelector(".subtotal");
const total= document.querySelector(".total");
const pago = document.querySelector(".pago");
const pagarCarrito = document.querySelector(".pagarCarrito");
var codigoCarrito = document.querySelector(".codigoCarrito");
codigoCarrito = (codigoCarrito.textContent.replace("Detalle de mi carrito:","")).trim();
console.log(codigoCarrito);
var sub = (subTotal.textContent.replace("Subtotal",""));
var nuevasub= Number(sub.replace("$",""));
arrayCantidad =[];
var itemCantidad = 1;

//captura botones restar y sumar items cantidad
addToShoppingCarButtons.forEach((addToCarButtons)=>{
    addToCarButtons.addEventListener("click", addToCartClicked);
});
restToShoppingCarButtons.forEach((addToCarButtons)=>{
    addToCarButtons.addEventListener("click", resToCartClicked);
});

//al presionar Boton Finalizar envia Datos Api mediante Fetch
pago.addEventListener("click",function(e){
    fetchFuncion(arrayCantidad);
    pago.style.display = "none";
    return 
});

//..................funciones..........................

//activa al sumar items cantidad
function addToCartClicked(e){
    const button = e.target;
    const item = button.closest(".detalle__compra");
    const itemPrecio = Number(item.querySelector(".precio").textContent.replace("$",""));
    const itemProdId = Number(item.querySelector(".idProdCarrito").textContent);
    const precios = item.querySelector("#precios");
    const cantidad =  item.querySelector("#cantidad");
    itemCantidad= Number(cantidad.value)+1;
    cantidad.value = itemCantidad;
    nuevasub = nuevasub +itemPrecio;
    sumaItem(itemProdId,itemCantidad);
    precios.innerHTML = `<p>
                            $${cantidad.value * itemPrecio}
                        </p>`
    subTotal.innerHTML = `<h3>Subtotal</h3>
                          <p>$${nuevasub}</p>`
    total.innerHTML = `<h2>Total</h2>
                          <p>$${nuevasub}</p>`
}

//activa funcion al restar item, minimo 0
function resToCartClicked(e){
    const button = e.target;
    const item = button.closest(".detalle__compra");
    const itemPrecio = Number(item.querySelector(".precio").textContent.replace("$",""));
    const itemProdId = Number(item.querySelector(".idProdCarrito").textContent);
    const precios = item.querySelector("#precios");
    const cantidad =  item.querySelector("#cantidad");
    itemCantidad= Number(cantidad.value)-1;
    //console.log(cantidad.value);
    if(cantidad.value >= 1 & nuevasub > 0){
        cantidad.value = itemCantidad;
    }
    /* if(nuevasub >= 0){
        itemCantidad = 0;
    }  */
    if(itemCantidad >= 0){
        sumaItem(itemProdId,itemCantidad);
        nuevasub = nuevasub - itemPrecio;
        precios.innerHTML = `<p>
                                $${cantidad.value * itemPrecio}
                            </p>`
    
        subTotal.innerHTML = `<h3>Subtotal</h3>
                              <p>$${nuevasub}</p>`
        total.innerHTML = `<h2>Total</h2>
                          <p>$${nuevasub}</p>`
    };
}

// agrega items cantidad al Array que viaja por Fetch
function sumaItem(itemProdId,itemCantidad){
    var newArray = arrayCantidad.filter((Element)=> {
        return (Element.productid != itemProdId);
    })
    newArray.push({"productid" : itemProdId, "cantidad" : itemCantidad , "idpedido": codigoCarrito});
    arrayCantidad = newArray;
    console.log(arrayCantidad);
    return arrayCantidad;
};

// funcion fetch envia datos a la api metodo postCarrito x POST, envia cantidades item modificadas
async function fetchFuncion(array){
    await fetch('http://localhost:5000/api/card',{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(array),
        cache: 'no-cache'
    })
    .then(function(response) {
        return response.json();
    })
    .then(function(data) {
        console.log('data = ', data);
    })
    .catch(function(err) {
        console.error(err);
    });
}
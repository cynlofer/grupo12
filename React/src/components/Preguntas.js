import React from 'react';

//importo la imagen que quiero insertar
import foto from '../assets/images/preguntas_2.png';

function Preguntas(){
    return(
        <React.Fragment>
        {/*<!-- Preguntas -->*/}
		<div className= 'container-fluid'>
            <h1 className= 'text-white bg-success text-center p-4 '>Preguntas Frecuentes</h1>
            <img className='w-100' src = {foto} alt = 'foto'/>
            <h4 class= 'text-grey p-4'>¿Cómo se realizan los envíos?</h4>
            <ul>Para los envíos utilizamos Correo Argentino ó mensajería, dependiendo de tu localidad.</ul>
            
            <h4 class= 'text-grey p-4'>¿Cuál es el costo de envío?</h4> 
            <ul>Compras por $3000 o más: El costo de envío se bonifica y se envía por mensajería en CABA y por Correo Argentino al resto del Pais.
                Compras de montos inferiores dependerán de la localidad a ser enviadas.</ul>
           
            <h4 class= 'text-grey p-4'>¿Cuáles son los tiempos de entrega estimados?</h4>
            <ul>Los plazos de entrega varían de acuerdo a la localidad a realizar la entrega, despachamos en un máximo de 48 horas, pero Correo Argentino puede demorar más de lo habitual por las actuales circunstancias sanitarias. 
                Los envíos en moto se realizan únicamente en CABA, se entregan con un plazo máximo de 48 horas y son gratis a partir de los $ 3000.</ul>
                     
            <h4 class= 'text-grey p-4'>¿Cómo hago para pagar mi compra?</h4>

            <ul>Podes abonar tu compra de dos maneras:</ul>
    
            <li>Tarjeta de crédito: a través de Mercado Pago accediendo desde nuestro sitio.</li> 
       
            <li>Transferencia Bancaria: Una vez que te confirmamos que tu pedido está preparado te enviaremos los datos de la cuenta bancaria. 
             Una vez realizada la transferencia, nos envias el comprobante de la misma junto al número de pedido a consultas@lcsrsupplies.com.ar y te enviamos el pedido.</li>
           
             </div>
            
        

        {/*<!-- End of Preguntas -->*/}
        </React.Fragment>
    )
}
export default Preguntas;
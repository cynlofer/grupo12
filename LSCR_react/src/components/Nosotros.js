import React from 'react';

//importo la imagen que quiero insertar
import foto from '../assets/images/nosotros_4.png';

function Nosotros(){
    return(
        <React.Fragment>
        {/*<!-- Nosotros -->*/}
		<div className= 'container-fluid'>
            <h1 className= 'text-white bg-info text-center p-4 '>Quienes somos</h1>
            <img className='w-100' src = {foto} alt = 'foto'/>
            <h4 className= 'text-center p-4 '></h4>
            <ul>En LCSR Supplies ofrecemos venta online de productos artísticos y escolares al por menor, con envío al comprador a través de mensajería o Correo Argentino, a todo el país.</ul>

            <ul>Los métodos de pago pueden ser tarjeta de crédito, débito o transferencias bancarias.</ul>

            <ul>Ofrecemos dos lineas de productos:</ul>
            <ul>Artistica y Técnica, en ambos casos tenemos las más reconocidas marcas disponibles para que elijas los mejores productos del mercado.</ul>
            
          
            
        </div>
        {/*<!-- End of Nosotros -->*/}
        </React.Fragment>
    )
}
export default Nosotros;
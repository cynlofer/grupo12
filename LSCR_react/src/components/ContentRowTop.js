import React from 'react';
import SmallCard from './SmallCard';

let productInDataBase = {
    color:   "danger",
    titulo: "Productos en la Base de Datos",
    valor: 12,
    icono: "fa-clipboard-list",
    moneda: false 
}

let amount ={
    color:   "info",
    titulo: "Ventas Totales",
    valor: 17500,
    icono: "fa-dollar-sign",
    moneda: true
}

let user = {
    color:   "success",
    titulo: "Cantidad de Usuarios",
    valor: 38,
    icono: "fa-user-check",
    moneda: false
}

let cardProps = [productInDataBase,amount,user];


function ContentRowTop(){
    return (
        <React.Fragment>
        {/*<!-- Content Row -->*/}
        <div className="row">
            {
                cardProps.map((producto,index)=>{
                    return <SmallCard  {...producto}  key= {index}/> 
                })
            }      
        </div>
        </React.Fragment>
    )
}
export default ContentRowTop;
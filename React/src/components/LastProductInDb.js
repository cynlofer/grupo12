import React from 'react';
//Aquí hago la importanción de la imagen: photo_home_3.png
//import photo from '../assets/images/photo_home_3.png';


function LastProductInDb(props){
    return(
        <React.Fragment>
            <div className="col-lg-6 mb-4">
                <div className="card shadow mb-4">
                    <div className="card-header py-3">
                        <h6 className="m-0 font-weight-bold text-primary">Last product in Data Base</h6>
                    </div>
                    <div className="card-body">
                        <div className="text-center">
                            <img className="img-fluid px-3 px-sm-4 mt-3 mb-4" style={{width: 25+'rem'}} src={'http://localhost:5000/images/products'+ props.images} alt="imagen"/>
                        </div>
                        <p>{props.descripcion}</p>
                        <h5>Titulo: {props.name}</h5>
                        <h5>Precio: ${props.price}</h5>
                    </div>
                </div>
            </div>

        </React.Fragment>
    )
}
export default LastProductInDb;
//Trabajando con componentes de estado - Clases
//Apis  - Eventos

import React, {Component} from 'react';
import Swal from 'sweetalert2';

//Importar nuestro componente
import ProductList from './ProductList';

class Product extends Component{
    constructor(){
        super()
        this.state ={
            productos : []
        }
    }
    //Creando un método
    mensaje(){
        Swal.fire({
            title: 'Bienvenidos a nuestro sitio web!',
            text: 'Tenemos las mejores productos de librería artística y técnica',
            icon: 'warning',
            timer: '5000'
        })
    }

    //Compomentes Ciclo de vida - Monto - Actualizo - Desmonto
    //Montaje
    componentDidMount(){
        fetch('/api/products')
        .then(respuesta =>{
            return respuesta.json()
        })
        .then(productos =>{
            //console.log(productos.resultados)
            this.setState({productos: productos.resultados})
        })
        .catch(error => console.log(error))

    }


    render(){
        return (
            <React.Fragment>
            {/*<!-- PRODUCTS LIST -->*/}
            <h3  onClick= {this.mensaje}  className="h3 mb-2 text-primary">Todos los productos de la Base de datos</h3>
            
            {/*<!-- DataTales Example -->*/}
            <div className="card shadow mb-4">
                <div className="card-body">
                    <div className="table-responsive">
                        <table className="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Precio</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                {
                                    //console.log(this.state.productos)
                                    this.state.productos.map((producto,index)=>{
                                        return <ProductList  {...producto} key={index}  />
                                    })
                                }
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>


    
    </React.Fragment>
    )
}
}
export default Product;

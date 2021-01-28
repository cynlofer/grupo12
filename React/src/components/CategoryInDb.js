import React, {Component} from 'react';
import Category  from './Category';

class CategoryInDb extends Component{

    constructor(){
        super();

        this.state = {

            categorias : [],
        }
    }
 componentDisMount(){

    fetch('/api/products/categorias')
    .then(respuesta=>{
         return respuesta.json()
    })
    .then(categorias =>{

        this.setState({categorias: categorias.respuesta})
        console.log(categorias)
    })
    .catch(error => console.log(error))
}
   render(){
return (

         
        <React.Fragment>
           
           
            {/*<!-- Categories in DB -->*/}
<div clas="col-lg-6 mb-4">				
<div className="card shadow mb-4">
<div className="card-header py-3">
<h6 className="m-0 font-weight-bold text-primary">Categoria in Data Base</h6>
<hr className="line-big"/>

<div className="card-body">
    <div className="row-categories">
        {this.state.categorias.map((categoria, index)=>{
            return < Category {...categoria} key={index} />

            
        })}
       </div>
    </div>
    </div>
     </div>
    </div>
  

    </React.Fragment>
    )}

}
export default CategoryInDb;
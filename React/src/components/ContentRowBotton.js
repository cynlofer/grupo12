import React, {Component} from 'react';
import LastProductInDb from './LastProductInDb';
import CategoryInDb from './CategoryInDb';


class ContentRowBotton extends Component{
    constructor(){
        super();

        this.state = {

            producto : [],

        }
    }
    componentDidMount(){
                   
        fetch('/api/products/one')
        .then(respuesta=>{
            return respuesta.json()
        })
        .then(producto =>{
            
            this.setState({producto: producto.resultados})

            console.log(producto.resultados);

        })
        .catch(error => console.log(error))
    }
    render(){

        return (
            <React.Fragment>
            {/*<!-- Content Row -->*/}
            <div className="row row-botton">

            {/*<!-- Last Product in DB -->*/}
            {
                 this.state.producto.map((valor, index)=>{
                    return <LastProductInDb {...valor} key= {index} />
                })

            }
            
            <CategoryInDb/>       

            </div>
            
         </React.Fragment>
        )
    }
}
export default ContentRowBotton;
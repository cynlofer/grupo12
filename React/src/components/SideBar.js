import React from 'react';
import logo from '../assets/images/logo_nuevo.png';
//importar el componente link
import {Link,Route, Switch} from 'react-router-dom';

//importo los componentes externos a utilizar
import Content from './Content';
import Nosotros from './Nosotros';
import Preguntas from './Preguntas';


function SideBar(){
    return(
        <React.Fragment>
        {/*<!-- Sidebar -->*/}
		<ul className="navbar-nav bg-gradient-light sidebar sidebar-primary accordion" id="accordionSidebar">

			{/*<!-- Sidebar - Brand -->*/}
			<Link className="sidebar-brand d-flex align-items-center justify-content-center" href="/">
				
					
				<img className="imagenLogo" src={logo} width="200" alt='logotipo' />
			</Link>

			{/*<!-- Divider -->*/}
			<hr className="sidebar-divider my-0"/>

		

			{/*<!-- Divider -->*/}
			<hr className="sidebar-divider"/>

			{/*<!-- Heading -->*/}
			<div className="sidebar-heading">Podemos ayudarte?</div>

			

			{/*<!-- Nav Item - Contacto -->*/}
			<li className="nav-item">
				<Link className="nav-link" to="/">
					<i className="fas fa-fw fa-home"></i>
					<span>Inicio</span></Link>
			</li>

			{/*<!-- Nav Item - Preguntas Frecuentes -->*/}
			<li className="nav-item">
				<Link className="nav-link" to="/preguntasfrecuentes">
					<i className="fas fa-fw fa-question-circle"></i>
					<span>Preguntas Frecuentes</span></Link>
			</li>

			{/*<!-- Nav Item - Nosotros -->*/}
			<li className="nav-item">
				<Link className="nav-link collapsed" to="/nosotros">
					<i className="fas fa-fw fa-users"></i>
					<span>Nosotros</span>
				</Link>
			</li>

			{/*<!-- Divider -->*/}
			<hr className="sidebar-divider d-none d-md-block"/>
		</ul>
		{/*<!-- End of Sidebar -->*/}


{/*Aca debo armar mis rutas*/}
<Switch>
<Route exact path = '/' component ={Content}/>
<Route exact path = '/nosotros' component ={Nosotros}/>
<Route exact path = '/preguntasfrecuentes' component ={Preguntas}/>
</Switch>
        </React.Fragment>
    )
}
export default SideBar;
import React from 'react';
import logo from '../assets/images/logo_nuevo.png';
 
function SideBar(){
    return(
        <React.Fragment>
        {/*<!-- Sidebar -->*/}
		<ul className="navbar-nav bg-gradient-light sidebar sidebar-primary accordion" id="accordionSidebar">

			{/*<!-- Sidebar - Brand -->*/}
			<a className="sidebar-brand d-flex align-items-center justify-content-center" href="/">
				
					
				<img className="imagenLogo" src={logo} width="200" alt='logotipo' />
			</a>

			{/*<!-- Divider -->*/}
			<hr className="sidebar-divider my-0"/>

		

			{/*<!-- Divider -->*/}
			<hr className="sidebar-divider"/>

			{/*<!-- Heading -->*/}
			<div className="sidebar-heading">Podemos ayudarte?</div>

			

			{/*<!-- Nav Item - Contacto -->*/}
			<li className="nav-item">
				<a className="nav-link" href="/">
					<i className="fas fa-fw fa-envelope"></i>
					<span>Contacto</span></a>
			</li>

			{/*<!-- Nav Item - Preguntas Frecuentes -->*/}
			<li className="nav-item">
				<a className="nav-link" href="/">
					<i className="fas fa-fw fa-question-circle"></i>
					<span>Preguntas Frecuentes</span></a>
			</li>

			{/*<!-- Nav Item - Nosotros -->*/}
			<li className="nav-item">
				<a className="nav-link collapsed" href="/">
					<i className="fas fa-fw fa-users"></i>
					<span>Nosotros</span>
				</a>
			</li>

			{/*<!-- Divider -->*/}
			<hr className="sidebar-divider d-none d-md-block"/>
		</ul>
		{/*<!-- End of Sidebar -->*/}

        </React.Fragment>
    )
}
export default SideBar;
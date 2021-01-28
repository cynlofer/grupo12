import React from 'react';
import imagen from '../assets/images/picasso.png';

function NavBar(){
    return(
        <React.Fragment>
            {/*<!-- Topbar -->*/}
				<nav className="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					{/*<!-- Sidebar Toggle (Topbar) -->*/}
					<button id="sidebarToggleTop" className="btn btn-link d-md-none rounded-circle mr-3">
						<i className="fa fa-bars"></i>
					</button>

					{/*<!-- Topbar Navbar -->*/}
					<ul className="navbar-nav ml-auto">


                    {/*<!-- Nav Item - Cuenta -->*/}
                        <li className="nav-item dropdown no-arrow">
							<a className="nav-link dropdown-toggle" href="/" id="userDropdown">
							<button type="button" class="btn btn-primary">Cuenta</button>
								
							</a>
						</li>

						


					<div className="topbar-divider d-none d-sm-block"></div>
                        
						{/*<!-- Nav Item - Shopping cart -->*/}
						<li className="nav-item dropdown no-arrow mx-1">
							<a className="nav-link dropdown-toggle" href="/" id="messagesDropdown">
								<i className="fas fa-shopping-cart fa-fw"></i>
								{/*<!-- Counter - shopping cart -->*/}
								<span className="badge badge-danger badge-counter">3</span>
							</a>
						</li>

						<div className="topbar-divider d-none d-sm-block"></div>

						{/*<!-- Nav Item - User Information -->*/}
						<li className="nav-item dropdown no-arrow">
							<a className="nav-link dropdown-toggle" href="/" id="userDropdown">
								<span className="mr-2 d-none d-lg-inline text-gray-600 small">Pablo Picasso</span>
								<img className="img-profile rounded-circle" src={imagen} width="60" alt='Imagen de Pablo Picasso'/>
							</a>
						</li>
                        
						<div className="topbar-divider d-none d-sm-block"></div>

							{/*<!-- Nav Item - log out -->*/}
							<li className="nav-item dropdown no-arrow mx-1">
							<a className="nav-link dropdown-toggle" href="/" id="alertsDropdown">
								<i className="fas fa-sign-out-alt  fa-fw"></i>
								
							</a>
						</li>

					</ul>

				</nav>
				{/*<!-- End of Topbar -->*/}

        </React.Fragment>
    )
}
export default NavBar;
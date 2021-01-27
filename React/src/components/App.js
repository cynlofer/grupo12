import React from 'react';
import SideBar from './SideBar';
import Content from './Content';

function App(){
  return(
    <React.Fragment>
      <div id="wrapper">
        <SideBar />
        <Content />
      </div>
    </React.Fragment>
  )
}
export default App;
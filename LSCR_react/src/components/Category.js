import React from 'react';

function Category(props){
    return(
        <React.Fragment>
            <div className="card shadow mb-4">
              <div className="category-row">
                <div className="categories">
                    <div className="cate-title" className="text-center">
                    {props.name}
                    </div>
                </div>
              </div>
            </div>
        </React.Fragment>
    )
}
export default Category;
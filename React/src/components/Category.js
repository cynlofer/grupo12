import React from 'react';

function Category(props){
    return(
        <React.Fragment>
            <div className="col-lg-4 mb-4">
            <div className="category-row">
                <div className="categories">
                    <div className="cate-title">
                    {props.categories}: {props.name}
                    </div>
                </div>
            </div>
         </div>
        </React.Fragment>
    )
}
export default Category;
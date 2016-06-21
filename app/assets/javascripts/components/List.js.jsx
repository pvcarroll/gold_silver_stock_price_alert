var List = React.createClass({
    
   render: function() {
       return (
           <div className="dropdown">
               <div className="dropdown-toggle" data-toggle="dropdown"></div>
               <ul className="dropdown-menu">
                   {this.props.items.map(function(item) {
                       return <li key={item} onClick={function() {document.getElementById('stockInput').value = {item}.item;}}>{item}</li>
                   })}
               </ul>
           </div>
       );
   }
});
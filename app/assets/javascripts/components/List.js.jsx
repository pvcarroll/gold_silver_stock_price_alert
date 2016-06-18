var List = React.createClass({
   render: function() {
       return (
           <ul>{this.props.items.map(function(item) {
               return <li key={item}>{item}</li>
           })}</ul>
       );
   }
});
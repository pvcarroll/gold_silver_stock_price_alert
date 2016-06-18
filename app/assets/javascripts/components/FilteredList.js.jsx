var stocks = ['GOOG/PINK_LAWEQ,Law Enforcem Assoc (LAWEQ)',
    'GOOG/PINK_WIPSM,Wisconsin Public Service Corporation (WIPSM)',
    'GOOG/NYSE_IRF,International Rectifier Corporation (IRF)'];

var FilteredList = React.createClass({

    filterList: function(event) {
        var updatedList = stocks;

        updatedList = updatedList.filter(function(item) {
            return item.toLowerCase().search(event.target.value.toLowerCase()) !== -1;
        });
        this.setState({items: updatedList});

        $('.dropdown-toggle').dropdown('toggle');
    },

    getInitialState: function() {
        return {items: []}
    },

    componentWillMount: function() {
        this.setState({items: stocks})
    },

    render: function() {
        return (
            <div className="myList">
                <input type="text" placeholder="Stock" onChange={this.filterList} />
                <List items={this.state.items} />
            </div>
        );
    }
});
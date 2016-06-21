var stocks = ["GOOG/PINK_LAWEQ,Law Enforcem Assoc (LAWEQ)",
    "GOOG/PINK_WIPSM,Wisconsin Public Service Corporation (WIPSM)",
    "GOOG/NYSE_IRF,International Rectifier Corporation (IRF)",
    "GOOG/SGX_5SS,Harry S Hldg Ltd. (5SS)",
    "GOOG/PINK_VBDG,Vertical Branding Inc (VBDG)",
    "GOOG/NASDAQ_GTSI,Unicom Government Inc (GTSI)",
    "GOOG/OTC_DKIN,Drucker Inc (DKIN)",
    "GOOG/STO_SCH_O,Schibsted (SCH-O)",
    "GOOG/NASDAQ_MAPP,MAP Pharmaceuticals Inc. (MAPP)",
    "GOOG/SHE_000829,Telling Telecom Holding Co., Ltd. (000829)",
    "GOOG/NYSE_GRT_F,Glimcher Rlty Pfd F (GRT-F)",
    "GOOG/PINK_CDARF,CANADIAN ARROW MINES (CDARF)",
    "GOOG/PINK_ISEYF,WI2WI CORP (ISEYF)",
    "GOOG/NASDAQ_MCBK,Madison County Financial Inc (MCBK)",
    "GOOG/OTCBB_TNIX,Telanetix Inc (TNIX)",
    "GOOG/NASDAQ_CBEY,Cbeyond, Inc. (CBEY)",
    "GOOG/EPA_ALNEO,Neotion SA (ALNEO)",
    "GOOG/PINK_TAMB,Tamalpais Bancorp (TAMB)",
    "GOOG/NASDAQ_NIHD,NII Holdings Inc (NIHD)",
    "GOOG/NASDAQ_SONO,Fujifilm Sonosite Inc (SONO)",
    "GOOG/PINK_TRUHF,TRULY INT'L HOLDINGS (TRUHF)",
    "GOOG/NASDAQ_DBLE,Double Eagle Petroleum Co (DBLE)",
    "GOOG/OTC_TRNT,Transnet Corp (TRNT)",
    "GOOG/OTC_MNLU,Mainland Resources (MNLU)",
    "GOOG/BVMF_SGEN3,Sergen Servicos Gerais de Engenharia SA (SGEN3)",
    "GOOG/NASDAQ_LOOP,LoopNet, Inc. (LOOP)",
    "GOOG/PINK_CECX,China Executive Ed (CECX)",
    "GOOG/STO_COIC,Concentric AB (COIC)",
    "GOOG/EPA_OROS,Orosdi SCA (OROS)",
    "GOOG/NSE_GLORY,Glory Polyfilms Limited (GLORY)"];

function setStockFieldValue(eventTargetValue) {
    document.getElementById("hiddenStockField").value = eventTargetValue;
}

var FilteredList = React.createClass({

    filterList: function(event) {
        var updatedList = stocks;

        updatedList = updatedList.filter(function(item) {
            return item.toLowerCase().search(event.target.value.toLowerCase()) !== -1;
        });
        this.setState({items: updatedList});

        $('.dropdown').addClass('open');
        setStockFieldValue(event.target.value);
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
                <List items={this.state.items} />
                <input type="text" id="stockInput" className="form-control" placeholder="Stock" onChange={this.filterList} />
            </div>
        );
    }
});
! function (jet, $, server, util, debug) {
    "use strict";

    jet.waterfall = {
        init: function (pRegionId, pApexAjaxIdentifier) {
            require(["ojs/ojcore", "jquery", 'ojs/ojchart', 'ojs/ojlegend'], function (oj, $) {
                
           var colorHandler = new oj.ColorAttributeGroupHandler();
            colorHandler.addMatchRule(-1, '#ed6647');
            colorHandler.addMatchRule(1, '#68c182');
      
            var values = [];
            var groups = [];

            var createWaterfallData = function (vals) {
                    var data = [];
                    var values = vals.slice();
                    values.unshift(vals[0]);
                    for (var i = 0; i < values.length; i++) {
                        var items;
                        if (i === values.length - 1 || i === 0) {
                            items = {high: values[i], low: 0, color: colorHandler.getValue(0), shortDesc: "Value: " + values[i]};
                        }
                        else {
                            var diff = values[i + 1] - values[i];
                            items = {low: values[i], high: values[i + 1], color: colorHandler.getValue(diff / Math.abs(diff)), shortDesc: "Change: " + diff};
                        }
                        data.push(items);
                    }
                    return data;
            }
            
            server.plugin(pApexAjaxIdentifier, {}, {
                success: function (pData) {
                
                    var jData   =  pData.items;
                    
                    for (var j in jData) {

                        values.push(jData[j].value);
                        groups.push(jData[j].group);
                    }

                    var referenceObjects = [    {items: values, type: 'line', lineType: 'segmented', lineWidth: 1, lineStyle: 'dotted', color: '#808080', shortDesc: 'Connecting Line'}];
                    var legendSections   = [{items: [{color: colorHandler.getValue(1), text: "Increase", id: "Increase"}, 
                                      {color: colorHandler.getValue(-1), text: "Decrease", id: "Decrease"}, 
                                      {color: colorHandler.getValue(0), text: "Total", id: "Total"}]}];

                    var itms = createWaterfallData(values);  
                    $(pRegionId).ojChart(
                        {
                            type: 'bar',
                            "animation-on-display":"auto" , 
                            "yAxis" : {"reference-objects":referenceObjects},
                            "style-defaults": {"data-item-gaps":"0"} ,
                            legend:{sections:legendSections},
                            groups:groups ,
                            series:[{items: itms, displayInLegend: "off"}]}
                    );
                }
            });

            });
        }
    }
}(window.jet = window.jet || {}, apex.jQuery, apex.server, apex.util, apex.debug);
var World = {
loaded: false,
    
init: function initFn() {
    this.createOverlays();
},
    
createOverlays: function createOverlaysFn() {
},
    
worldLoaded: function worldLoadedFn() {
    var cssDivLeft = " style='display: table-cell;vertical-align: middle; text-align: right; width: 50%; padding-right: 15px;'";
    var cssDivRight = " style='display: table-cell;vertical-align: middle; text-align: left;'";
    document.getElementById('loadingMessage').innerHTML =
    "<div" + cssDivLeft + ">Scan Target &#35;1 (surfer):</div>" +
    "<div" + cssDivRight + "><img src='assets/surfer.png'></img></div>";
    
    // Remove Scan target message after 10 sec.
    setTimeout(function() {
               var e = document.getElementById('loadingMessage');
               e.parentElement.removeChild(e);
               }, 10000);
}
};

World.init();
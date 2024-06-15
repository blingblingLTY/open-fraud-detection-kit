var page = require('webpage').create(),
    system = require('system');


var address = system.args[1];
var output = system.args[2];
console.log(system.args[2]);
page.viewportSize = { width: system.args[3], height: system.args[4] };


page.zoomFactor = system.args[5];

page.open(address, function (status) {
    if (status !== 'success') {
        console.log('Error: Unable to load the address!');
        phantom.exit();
    } else {
        window.setTimeout(function () {
            page.render(output);
            phantom.exit();
        }, 500);
    }
});


var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
        var output = document.getElementById('output');
        output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
    };
    var loadFile1 = function(event) {
    var reader1 = new FileReader();
    reader1.onload = function(){
        var output1 = document.getElementById('output1');
        output1.src = reader1.result;
    };
    reader1.readAsDataURL(event.target.files[0]);
    };
    var loadFile2 = function(event) {
    var reader2 = new FileReader();
    reader2.onload = function(){
        var output2 = document.getElementById('output2');
        output2.src = reader2.result;
    };
    reader2.readAsDataURL(event.target.files[0]);
    };
    var loadFile3 = function(event) {
    var reader3 = new FileReader();
    reader3.onload = function(){
        var output3 = document.getElementById('output3');
        output3.src = reader3.result;
    };
    reader3.readAsDataURL(event.target.files[0]);
};

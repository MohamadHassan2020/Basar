function rowfocus() {
    var i;
    var inputs = document.querySelectorAll("tr > td > input");
    for (i = 0; i < inputs.length; ++i) {
        inputs[i].addEventListener('focus', function (e) {
            this.parentNode.parentNode.className += ' highlight';
        });
        inputs[i].addEventListener('blur', function (e) {
            this.parentNode.parentNode.className = this.parentNode.parentNode.className.replace(/\s*highlight\s*/ig, ' ');
        });
    }
     
}

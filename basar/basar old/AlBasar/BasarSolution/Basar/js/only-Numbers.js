//Restrict the user to key-in chrectors and other special charectors
function onlyNumbers(evt) {
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function validateNumberOnly() {
    if ((event.keyCode < 48 || event.keyCode > 57)) {
        event.returnValue = false;
    }
}
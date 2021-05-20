$(document).ready(function () {

    $('#phn').focusout(function () {

        var pattern = /^([0-9]{10})$/;
        var phn = $("#phn").val();
        if (phn.length == 10) {

            if (pattern.test(phn) && phn !== '') {
                $('#phmessage').html('').css('color', 'green');
            }
            else {
                $('#phmessage').html('Phone Number Should contain only Digits').css('color', 'red');
                alert("Phone Number Should contain only Digits");
            }
        }
        else {
            $('#phmessage').html('Phone Number should contains 10 Digits').css('color', 'red');
            alert("Phone Number should contains 10 Digits");
        }
    });

    $('#email').focusout(function () {

        var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;
        var email = $("#email").val();
        if (pattern.test(email) && email !== '') {
            $('#email_message').html('').css('color', 'green');
        }
        else {
            $('#email_message').html('Invalid email').css('color', 'red');
            alert("Invalid email");
        }
    });

    





});


function userValid() {
    usertype = document.getElementById("usertype").value;
    if (usertype == '') {
        alert("Please Select User Type");
        return false;
    }
    return true;
}
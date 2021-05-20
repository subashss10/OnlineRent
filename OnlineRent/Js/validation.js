function userValid() {
    var fName, lName, password, usertype, confirm, EmailId, phoneNumber, emailExp, phnExp;
    fName = document.getElementById("fName").value;
    lName = document.getElementById("lName").value;
    usertype = document.getElementById("usertype").value;
    password = document.getElementById("password").value;
    confirm = document.getElementById("confirm").value;
    phoneNumber = document.getElementById("phn").value;
    EmailId = document.getElementById("email").value;
    phnExp = /^([0-9]{10})$/;
    emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id    
    //if (fName == '' && lName == '' && usertype == '' && password == '' && confirm == '' && phoneNumber == '' && EmailId == '') {
    //    alert("Enter All Fields");
    //    return false;
    //}
    //if (fName == '') {
    //    alert("Please Enter First Name");
    //    return false;
    //}
    //if (lName == '') {
    //    alert("Please Enter Last Name");
    //    return false;
    //}
    if (usertype == '') {
        alert("Please Select User Type");
        return false;
    }
    //if (password == '') {
    //    alert("Please Enter Password");
    //    return false;
    //}
    //if (password != '' && confirm == '') {
    //    alert("Please Confirm Password");
    //    return false;
    //}
    //if (password != con) {
    //    alert("Passwords not match");
    //    return false;
    //}
    if (EmailId != '') {
        if (!EmailId.match(emailExp))    
    {
            alert("Invalid Email Id");
            return false;
        }
    }    
    if (phoneNumber.length == 10) {

        if (!pattern.test(phoneNumber)) {
            $('#phmessage').html('Should contain only Digits').css('color', 'red');
            return false;
        }
    }
    else {
        $('#phmessage').html('Phone Number should contains 10 Digits').css('color', 'red');
        return false;
    }
   
    return true;
}  

  
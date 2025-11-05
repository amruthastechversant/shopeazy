


var modalElement = document.getElementById('userloginModal');
var adminmodalElement=document.getElementById('adminloginModal');
var sellermodalElement=document.getElementById('sellerloginModal');
// Get the user link and modal close button
var userloginBtn = document.getElementById("userloginBtn");
var adminloginBtn=document.getElementById('adminloginbtn');
var sellerloginBtn=document.getElementById('sellerloginbtn');
var userCloseBtn = document.getElementById('userCloseBtn');
var adminCloseBtn = document.getElementById('adminCloseBtn');
var showadminloginModal=false;
var showuserloginModal =false;  


// Open modal when user clicks on the "User" link
if(userloginBtn){
userloginBtn.onclick = function() {
    modalElement.style.display = "block";
}
}
if(adminloginBtn){
adminloginBtn.onclick = function(){
    adminmodalElement.style.display="block";
}
}
if(sellerloginBtn){
sellerloginBtn.onclick=function(){
    sellermodalElement.style.display="block";
}
}
// Close modal when user clicks the "x" button
userCloseBtn.onclick = function() {
    modalElement.style.display = "none";
}

adminCloseBtn.onclick = function() {
    adminmodalElement.style.display = "none";
}

sellerCloseBtn.onclick = function(){
    sellermodalElement.style.display = "none";
}



// Close modal if the user clicks outside the modal content
window.onclick = function(event) {
    if (event.target === modalElement) {
        modalElement.style.display = "none";
    }

    if(event.target === adminmodalElement){
        adminmodalElement.style.display="none";
    }
    if(event.target === adminmodalElement){
        sellermodalElement.style.display="none";
    }

   

}



    window.addEventListener("DOMContentLoaded", function() {
        if (showuserloginModal) {
            modalElement.style.display = "block";  // Show the user login modal
        } else if (showadminloginModal) {
            adminmodalElement.style.display = "block";  // Show the admin login modal
        }
      
    });

function showError(message){
    var errormessagecontainer=document.getElementById('errorMessage');
    var errorText=document.getElementById('errorText');

    errorText.textContent=message;
    errormessagecontainer.style.display="block";

}


function showErrorUser(message){
    var errormessagecontainer=document.getElementById('errormsg');
    var errortext=document.getElementById('errortext');

    errortext.textContent=message;
    errormessagecontainer.style.display="block";

}

document.getElementById('adminLoginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    var email = document.getElementById('adminEmail').value;
    var password = document.getElementById('adminPassword').value;

    if (!email || !password) {
        showError("Please enter Email & password for admin");
    }
    
    var email=$('#adminEmail').val();
    var password=$('#adminPassword').val();

    $.ajax({
        url: '/myprojects/shopeazy/users/login/loginAction.cfm?login=true',
        type: 'POST',
        data: {
            email: email,
            password: password,
            login: true 
        },
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                window.location.href = response.redirect_url;
            } else {
                $('#errorMessage').text(response.message).show();
            }
        },
        error: function() {
            $('#errorMessage').text('An error occurred. Please try again.').show();
        }
    });
});


document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    var useremail = document.getElementById('userEmail').value;
    var userpassword = document.getElementById('userPassword').value;

    if (!useremail || !userpassword) {
        showErrorUser("Please enter Email & password for user");
    }

    var useremail=$('#userEmail').val();
    var userpassword=$('#userPassword').val();

    $.ajax({
        url: '/myprojects/shopeazy/users/login/loginAction.cfm?userlogin=true',
        type: 'POST',
        data: {
            email: useremail,
            password: userpassword,
            login: true 
        },
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                window.location.href = response.redirect_url;
            } else {
                $('#errormsg').text(response.message).show();
            }
        },
        error: function() {
            $('#errormsg').text('An error occurred. Please try again.').show();
        }
    });
});

document.getElementById('sellerLoginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    var email = document.getElementById('sellerEmail').value;
    var password = document.getElementById('sellerPassword').value;

    if (!email || !password) {
        showError("Please enter Email & password for admin");
    }
    
    var email=$('#sellerEmail').val();
    var password=$('#sellerPassword').val();

    $.ajax({
        url: '/myprojects/shopeazy/users/login/loginAction.cfm?sellerlogin=true',
        type: 'POST',
        data: {
            email: email,
            password: password,
            login: true 
        },
        dataType: 'json',
        success: function(response) {

            if (response.status === 'success') {
                window.location.href = response.redirect_url;
            } else {
                $('#errorMessage').text(response.message).show();
            }
        },
        error: function() {
            $('#errorMessage').text('An error occurred. Please try again.').show();
        }
    });
});

function deleteCartItem(product_id) {
    if (!confirm("Are you sure you want to delete this item?")) return;

    fetch('cartPageAction.cfm?deleteItemId=' + product_id)
        .then(response => response.text())
        .then(data => {
            if(data.success){ 
             document.getElementById("deletemessage").innerHTML="product removed";
      
            }
        })
        .catch(error => {
            console.error("Delete failed:", error);
            alert("Failed to delete item.");
        });
}


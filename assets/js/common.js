


var modalElement = document.getElementById('userloginModal');
var adminmodalElement=document.getElementById('adminloginModal');
var sellermodalElement=document.getElementById('sellerloginModal');
// Get the user link and modal close button
var userloginBtn = document.getElementById("userloginBtn");
var adminloginBtn=document.getElementById('adminloginbtn');
var sellerloginBtn=document.getElementById('sellerloginbtn')
var userCloseBtn = document.getElementById('userCloseBtn');
var adminCloseBtn = document.getElementById('adminCloseBtn');


// Open modal when user clicks on the "User" link
userloginBtn.onclick = function() {
    modalElement.style.display = "block";
}
adminloginBtn.onclick=function(){
    adminmodalElement.style.display="block";
}

sellerloginBtn.onclick=function(){
    sellermodalElement.style.display="block";
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


function showError(message){
    var errormessagecontainer=document.getElementById('errorMessage');
    var errorText=document.getElementById('errorText');

    errorText.textContent=message;
    errormessagecontainer.style.display="block";

}
document.getElementById('adminLoginForm').addEventListener('submit', function(e) {

    var email = document.getElementById('adminEmail').value;
    var password = document.getElementById('adminPassword').value;

    if (!email || !password) {
        showError("Please enter Email & password");
        e.preventDefault();
    }
});

    // fetch('#application.appBasePath#users/login/loginAction.cfm', {  // Adjust the URL to your backend login endpoint
    //     method: 'POST',
    //     headers: {
    //         'Content-Type': 'application/json'
    //     },
    //     body: JSON.stringify({ email: email, password: adminPassword })
    // })
    // .then(response => {
    //     if (!response.ok) {
    //         throw new Error('Login failed');
    //     }
    //     return response.json();
    // })
    // .then(data => {
    //     // If the login is successful, redirect to the admin dashboard
    //     if (data.success) {
    //         window.location.href = '#application.appBasePath#admin/adminDashboard.cfm';  // Redirect to the admin dashboard page
    //     } else {
    //         showError(data.message || "invalid email or password");
    //     }
    // })
    // .catch(error => {
    //     // Handle any errors (e.g., network issues or server errors)
    //     showError(error.message || "An error occurred");
    // });



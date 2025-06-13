<cfinclude  template="loginAction.cfm">
<cfoutput>

<!--- USERLOGIN --->
<div id="userloginModal" class="modal">
<!---     <div class="modal-content custom-modal"> --->
    <div class="custom-modal">
      <span class="close" id="userCloseBtn">&times;</span>
      <h2>UserLogin</h2>
      <div id="errormsg" class="error-message" style="display: none;">
            <p id="errortext"></p>
      </div>
      <form id="loginForm" method="POST">
        <div class="input-container">
          <label for="userEmail">Email:</label>
          <input type="email" id="userEmail" name="userEmail" >
        </div>
        <div class="input-container">
          <label for="userPassword">Password:</label>
          <input type="password" id="userPassword" name="userPassword" >
        </div>
        <button type="submit" name="userlogin" class="buttonlogin">Login</button>
      </form>
        <p class="bottomlink text-center"><a href="#application.appBasePath#users/login/register.cfm" id="createaccount">New to Shopeazy? Create Account</a></p>
    </div>
</div>
<!--- ADMINLOGIN --->
<div id="adminloginModal" class="modal">
    <div class="custom-modal">
      <span class="close" id="adminCloseBtn">&times;</span>
      <h2>AdminLogin</h2>

       <div id="errorMessage" class="error-message" style="display: none;">
            <p id="errorText"></p>
        </div>
     
        <form id="adminLoginForm" method="POST">
        <div class="input-container">
          <label for="email">Email:</label>
          <input type="email" id="adminEmail" name="adminEmail" >
        </div>
        <div class="input-container">
          <label for="password">Password:</label>
          <input type="password" id="adminPassword" name="adminPassword" >
        </div>
        <button type="submit" name="login" class="buttonlogin">Login</button>
      </form>
    </div>
</div>
<!--- sellerLogin --->
<div id="sellerloginModal" class="modal">
    <div class="custom-modal">
      <span class="close" id="sellerCloseBtn">&times;</span>
      <h2>SellerLogin</h2>
      <form id="sellerLoginForm">
        <div class="input-container">
          <label for="email">Email:</label>
          <input type="email" id="sellerEmail" name="sellerEmail" required>
        </div>
        <div class="input-container">
          <label for="password">Password:</label>
          <input type="password" id="sellerPassword" name="sellerPassword" required>
        </div>
        <button type="submit" name="sellerLogin" class="buttonlogin">Login</button>
      </form>
       <p class="bottomlink text-center"><a href="#application.appBasePath#users/login/seller/register.cfm" id="createaccount">New to Shopeazy? Create seller Account</a></p>
    </div>
</div>

</cfoutput>

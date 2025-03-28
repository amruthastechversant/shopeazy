

<cfoutput>
<!--- USERLOGIN --->
<div id="userloginModal" class="modal">
<!---     <div class="modal-content custom-modal"> --->
    <div class="custom-modal">
      <span class="close" id="userCloseBtn">&times;</span>
      <h2>UserLogin</h2>
      <form id="loginForm">
        <div class="input-container">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div class="input-container">
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">Login</button>
      </form>
        <p class="bottomlink text-center"><a href="#application.appBasePath#users/login/register.cfm" id="createaccount">New to Shopeazy? Create Account</a></p>
    </div>
  </div>
<!--- ADMINLOGIN --->
<div id="adminloginModal" class="modal">
    <div class="custom-modal">
      <span class="close" id="adminCloseBtn">&times;</span>
      <h2>AdminLogin</h2>
      <form id="adminLoginForm">
        <div class="input-container">
          <label for="email">Email:</label>
          <input type="email" id="adminEmail" name="adminEmail" required>
        </div>
        <div class="input-container">
          <label for="password">Password:</label>
          <input type="password" id="adminPassword" name="adminPassword" required>
        </div>
        <button type="submit">Login</button>
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
        <button type="submit">Login</button>
      </form>
       <p class="bottomlink text-center"><a href="#application.appBasePath#users/login/seller/register.cfm" id="createaccount">New to Shopeazy? Create seller Account</a></p>
    </div>
</div>


</cfoutput>

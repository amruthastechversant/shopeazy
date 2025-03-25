

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
</cfoutput>

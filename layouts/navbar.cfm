<cfoutput>
    <div class="header">
        <a href="#application.appBasePath#index.cfm">
            <img src="#application.appBasePath#assets/img/logo.png" class="rounded-logo"alt="Your Logo">
        </a>
        <div class="d-flex justify-content-between align-items-center">
            <form class="d-flex justify-content-between align-items-center" action="#application.appBasePath#products/list.cfm" method="POST">
                <input type="search" class="form-control  mr-sm-2 ms-3 me-2" placeholder="Search" aria-label="Search" id="keyword" name="keyword" >
                <button type="submit" class="buttonIcon"><i class="fas fa-search"></i> </button>
            </form>
            <a href="#application.appBasePath#users/cart/cartPage.cfm"><i class="fa-solid fa-cart-shopping ms-4" style="font-size:3rem;"></i></a>
            <a href="#application.appBasePath#users/orders/orders.cfm"><i class="fa-solid fa-box ms-4" style="font-size:3rem;"></i></a>
            <a  id="userloginBtn" class="text-decoration-none text-white ms-4">User</a>
            <div class="dropdown ms-5" id="buttonhover">
                <div class="dropdown">
                    <a class="dropbtn text-decoration-none text-white"> Account
                        <i class="fa fa-caret-down"></i>
                     </a>
                    <div class="navbar-content">
                        <!-- Login options -->
                        <a href="#application.appBasePath#users/profile/userProfile.cfm">My Account</a>
                        <cfif structKeyExists(session, "email")>
                        <div class="sub-navbar">
                            <a href="">#session.email#</a>
                            <!-- Admin and User options -->
                            <div class="sub-navbar-content">
                                <a href="##" id="adminloginbtn">Admin</a>
                            </div>
                        </div>
                        <cfelse>
                        <div class="sub-navbar">
                            <a href="##">Login</a>
                            <!-- Admin and User options -->
                            <div class="sub-navbar-content">
                                <a href="##" id="adminloginbtn">Admin</a>
                            </div>
                        </div>
                        </cfif>
                        <a href="##" id="sellerloginbtn">Seller Account</a>
                        <a href="#application.appBasePath#logout.cfm" onclick= "return confirm('are you sure to logout?')">Sign Out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<cfinclude  template="#application.appBasePath#users/login/login.cfm">
</cfoutput>
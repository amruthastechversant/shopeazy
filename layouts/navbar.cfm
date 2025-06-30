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
                        <cfif structKeyExists(session, "isLoggedIn") and session.isLoggedIn EQ true>
                            <cfif structKeyExists(session, "role") and session.role EQ "admin">
                                <a href="#application.appBasePath#admin/adminDashboard.cfm">My Account</a>
                            <cfelse>
                                <a href="#application.appBasePath#users/login/seller/sellerHomePage.cfm">My Account</a>
                            </cfif>
                        </cfif>
                        <cfif structKeyExists(session, "email")>
                        <div class="sub-navbar">
                            <a href="">#session.email#</a>
                            <!-- Admin and User options -->
                        </div>
                        <cfelse>
                        <a href="##" id="sellerloginbtn">Seller Account</a>
                        <a href="##" id="adminloginbtn">Admin</a>
                        </cfif>
                        <cfif structKeyExists(session, "isLoggedIn") and session.isLoggedIn EQ true>
                        <a href="#application.appBasePath#logout.cfm" onclick= "return confirm('are you sure to logout?')">Sign Out</a>
                        </cfif>
                    </div>
                </div>
            </div>
        </div>
    </div>
<cfinclude  template="#application.appBasePath#users/login/login.cfm">
</cfoutput>
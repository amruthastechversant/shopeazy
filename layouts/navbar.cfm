<cfoutput>
    <div class="header">
        <a href="#application.appBasePath#index.cfm">
            <img src="#application.appBasePath#assets/img/logo.png" alt="Your Logo">
        </a>
        <div class="d-flex justify-content-between align-items-center">
            <form class="d-flex justify-content-between align-items-center" action="" method="">
                <input type="search" class="form-control  mr-sm-2 ms-3" placeholder="Search" aria-label="Search">
                <i class="fas fa-search my-2 ms-3"></i> 
            </form>
            <a href="#application.appBasePath#users/cart/cartPage.cfm"><i class="fa-solid fa-cart-shopping ms-4" style="font-size:3rem;"></i></a>
            <a href="#application.appBasePath#users/orders/orders.cfm"><i class="fa-solid fa-box ms-4" style="font-size:3rem;"></i></a>
            <a href="##" id="userloginBtn" class="text-decoration-none text-white ms-4">User</a>
            <div class="dropdown ms-5" id="buttonhover">
                <div class="dropdown">
                    <a class="dropbtn text-decoration-none text-white"> Account
                        <i class="fa fa-caret-down"></i>
                     </a>
                    <div class="dropdown-content">
                        <!-- Login options -->
                        <a href="">My Account</a>
                        <div class="sub-dropdown">
                            <a href="">Login</a>
                            <!-- Admin and User options -->
                            <div class="sub-dropdown-content">
                                <a href="##" id="adminloginbtn">Admin</a>
                            </div>
                        </div>
                        <a href="">Seller Account</a>
                        <a href="">Sign Out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<cfinclude  template="#application.appBasePath#users/login/login.cfm">

</cfoutput>
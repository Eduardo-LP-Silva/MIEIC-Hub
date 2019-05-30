
    <div id="cont" class="container" style="background: rgb(235,235,235);">
        <div style="margin-top: 3%" class="row">
            <div class="maininfo col-md-4">
                <div class="presentation row">
                    <img id="profilepicture" src="../resources/images/about-us/edu.jpg" alt="profile picture">
                    <span id="name"> Eduardo Silva</span>
                </div>
                <span class="separation"></span>
                <div class="status row">
                    <small style="margin-left: 10%">Just a regular MIEIC student.</small>
                </div>
                <span class="separation"></span>
                <div class="wishlist row">
                    <a href="./wishlist.html">
                        <button class="btn">Wishlist</button>
                    </a>

                    <a href="./settings.html">
                        <img src="../resources/images/website/settings-icon.png" alt="Settings">
                    </a>
                </div>
            </div>
            <div class="otherinfo col-md-8">
                <span id="separationver"></span>
                <div id="options_buttons">
                    <a href="./profile-orders.html"><button type="button" class="btn btn-danger">Orders</button></a> 
                    <a href="./profile-reviews.html"><button type="button" class="btn btn-danger" autofocus>Reviews</button></a> 
                </div>
                @yield('profile');
            </div>
        </div>
    </div>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
        <link rel="stylesheet" href="{{ asset('css/navbar.css') }}">
        <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
        @yield('stylesheets')

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous" defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous" defer></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous" defer></script>
        @yield('scripts')
        @yield('title')
    </head>
    <body>
        <!--Banner-->
        <div id="banner">
            <a href="{{url('/home')}}">MIEIC</a>
            <a href="{{url('/home')}}">Hub</a>
        </div>
        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-fill w-100">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="productsDD" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            Products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="productsDD">
                            <!-- Mudar os links para terem já a pesquisa correspondente da categoria -->
                            <a class="dropdown-item" href="{{url('/search')}}">Apparel</a>
                            <a class="dropdown-item" href="{{url('/search')}}">Phone Cases</a>
                            <a class="dropdown-item" href="{{url('/search')}}">Stickers</a>
                            <a class="dropdown-item" href="{{url('/search')}}">Posters</a>
                            <a class="dropdown-item" href="{{url('/search')}}">Tickets</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('/submit')}}">Submit your design</a>
                    </li>
                    <li class="nav-item justify-content-center" id="searchBar">
                        <form class="form-inline justify-content-center my-1">
                            <input type="text" name="" placeholder="Search">
                            <button type="submit" class="btn btn-light"></button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('/upcoming')}}">Upcoming</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="profileDD" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            <img src="{{asset('img/icons/baseline-person-24px.svg')}}"  alt="Profile">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="profileDD">
                            <!-- Fazer if se ta logged in e se sim substituir id, se não so mostrar log-in-->
                            <a class="dropdown-item" href="{{url('/users/{id}')}}">Profile</a>
                            <a class="dropdown-item" href="{{url('/users/{id}/wishlist')}}">Wishlist</a>
                            <a class="dropdown-item" href="{{url('/users/{id}/settings')}}">Settings</a>
                            <a class="dropdown-item" href="{{url('/logout')}}">Sign-out</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('/users/{id}/cart')}}">
                            <img src="{{asset('img/icons/cart.svg')}}" alt="Cart">
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    
        @yield('content')

        <!--Footer-->
        <footer id="footer">
            <a href="{{url('/about')}}">About us</a>
            <span></span>
            <a href="{{url('/faq')}}">FAQ</a>
            <span></span>
            <p>Contact us at mieichub@gmail.com</p>
        </footer>
    </body>
</html>

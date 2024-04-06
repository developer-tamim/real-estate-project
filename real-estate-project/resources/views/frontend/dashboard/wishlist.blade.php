@extends('frontend.frontend_dashboard')
@section('main')


    <!--Page Title-->
    <section class="page-title-two bg-color-1 centred">
        <div class="pattern-layer">
            <div class="pattern-1" style="background-image: url({{ asset('frontend/assets/images/shape/shape-9.png') }});">
            </div>
            <div class="pattern-2" style="background-image: url({{ asset('frontend/assets/images/shape/shape-10.png') }});">
            </div>
        </div>
        <div class="auto-container">
            <div class="content-box clearfix">
                <h1>WishList Property</h1>
                <ul class="bread-crumb clearfix">
                    <li><a href="index.html">Home</a></li>
                    <li>WishList Property</li>
                </ul>
            </div>
        </div>
    </section>
    <!--End Page Title-->


    <!-- property-page-section -->
    <section class="property-page-section property-list">
        <div class="auto-container">
            <div class="row clearfix">




                @include('frontend.dashboard.dashboard_sidebar')


                {{-- <div class="col-lg-4 col-md-12 col-sm-12 sidebar-side">


                    <div class="blog-sidebar">
                        <div class="sidebar-widget post-widget">
                            <div class="widget-title">
                                <h4>User Profile </h4>
                            </div>
                            <div class="post-inner">
                                <div class="post">
                                    <figure class="post-thumb"><a href="blog-details.html">
                                            <img src="{{ asset('frontend/assets/images/news/post-1.jpg') }}" alt=""></a></figure>
                                    <h5><a href="blog-details.html">Kazi Ariyan </a></h5>
                                    <p>user@gmail.com </p>
                                </div>
                            </div>
                        </div>


                        <div class="sidebar-widget category-widget">
                            <div class="widget-title">
                                <h4>Category</h4>
                            </div>
                            <div class="widget-content">
                                <ul class="category-list ">

                                    <li> <a href="blog-details.html"><i class="fab fa fa-envelope "></i> Dashboard </a></li>


                                    <li><a href="blog-details.html"><i class="fa fa-cog" aria-hidden="true"></i>
                                            Settings</a></li>
                                    <li><a href="blog-details.html"><i class="fa fa-credit-card" aria-hidden="true"></i> Buy
                                            credits<span class="badge badge-info">( 10 credits)</span></a></li>
                                    <li><a href="blog-details.html"><i class="fa fa-list-alt" aria-hidden="true"></i></i>
                                            Properties </a></li>
                                    <li><a href="blog-details.html"><i class="fa fa-indent" aria-hidden="true"></i> Add a
                                            Property </a></li>
                                    <li><a href="blog-details.html"><i class="fa fa-key" aria-hidden="true"></i> Security
                                        </a></li>
                                    <li><a href="blog-details.html"><i class="fa fa-chevron-circle-up"
                                                aria-hidden="true"></i> Logout </a></li>
                                </ul>

                            </div>
                        </div>
                    </div>






                </div> --}}



                <div class="col-lg-8 col-md-12 col-sm-12 content-side">
                    <div class="property-content-side">

                        <div class="wrapper list">
                            <div class="deals-list-content list-item">



                                <div id="wishlist"></div>


                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- property-page-section end -->


    <!-- subscribe-section -->
    <section class="subscribe-section bg-color-3">
        <div class="pattern-layer" style="background-image: url({{ asset('frontend/assets/images/shape/shape-2.png') }});">
        </div>
        <div class="auto-container">
            <div class="row clearfix">
                <div class="col-lg-6 col-md-6 col-sm-12 text-column">
                    <div class="text">
                        <span>Subscribe</span>
                        <h2>Sign Up To Our Newsletter To Get The Latest News And Offers.</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 form-column">
                    <div class="form-inner">
                        <form action="contact.html" method="post" class="subscribe-form">
                            <div class="form-group">
                                <input type="email" name="email" placeholder="Enter your email" required="">
                                <button type="submit">Subscribe Now</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- subscribe-section end -->
@endsection

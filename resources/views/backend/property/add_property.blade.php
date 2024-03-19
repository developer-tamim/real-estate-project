@extends('admin.admin_dashboard')
@section('content')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <div class="page-content">

        <div class="row profile-body">
            <!-- middle wrapper start -->
            <div class="col-md-12 col-xl-12 middle-wrapper">
                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title">Add Property</h6>
                            <form>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Property Name</label>
                                            <input type="text" name="property_name" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Property Status</label>
                                            <select name="property_status" class="form-select"
                                                id="exampleFormControlSelect1">
                                                <option selected="" disabled="">Select Status</option>
                                                <option value="rent">For Rent</option>
                                                <option value="buy">For Buy</option>
                                            </select>
                                        </div>
                                    </div><!-- Col -->

                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Lowest Price</label>
                                            <input type="text" name="lowest_price" class="form-control">
                                        </div>
                                    </div><!-- Col -->

                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Max Price</label>
                                            <input type="text" name="max_price" class="form-control">
                                        </div>
                                    </div><!-- Col -->

                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Main Thumnail</label>
                                            <input type="file" name="property_thumbnail" class="form-control"
                                                onchange="mainThumbUrl(this)">

                                            <img id="mainThumb" src="">

                                        </div>
                                    </div><!-- Col -->

                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Multiple Images</label>
                                            <input type="file" name="multi_img[]" class="form-control" id="multiImg"
                                                multiple="">

                                            <div class="row" id="preview_img"></div>

                                        </div>
                                    </div><!-- Col -->

                                </div><!-- Row -->


                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Bedrooms</label>
                                            <input type="text" name="bedrooms" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Bathrooms</label>
                                            <input type="text" name="bathrooms" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Garage</label>
                                            <input type="text" name="garage" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Garage Size</label>
                                            <input type="text" name="garage_size" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                </div><!-- Row -->


                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Address</label>
                                            <input type="text" name="address" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">City</label>
                                            <input type="text" name="city" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">State</label>
                                            <input type="text" name="state" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Postal Code</label>
                                            <input type="text" name="postal_code" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                </div><!-- Row -->

                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="mb-3">
                                            <label class="form-label">Property Size</label>
                                            <input type="text" name="property_size" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-4">
                                        <div class="mb-3">
                                            <label class="form-label">Property Video</label>
                                            <input type="text" name="property_video" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-4">
                                        <div class="mb-3">
                                            <label class="form-label">Neighborhood</label>
                                            <input type="text" name="neighborhood" class="form-control">
                                        </div>
                                    </div><!-- Col -->
                                </div><!-- Row -->



                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Latitude</label>
                                            <input type="text" name="latitude" class="form-control">
                                            <a href="https://www.latlong.net/convert-address-to-lat-long.html"
                                                target="_blank">Go here ti get Latitude from address</a>
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Longitude</label>
                                            <input type="text" name="longitude" class="form-control">
                                            <a href="https://www.latlong.net/convert-address-to-lat-long.html"
                                                target="_blank">Go here ti get Longitude from address</a>
                                        </div>
                                    </div><!-- Col -->
                                </div><!-- Row -->

                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="mb-3">
                                            <label class="form-label">Property Type</label>
                                            <select name="ptype_id" class="form-select" id="exampleFormControlSelect1">
                                                <option selected="" disabled="">Select Type</option>

                                                @foreach ($propertyType as $ptype)
                                                    <option value="{{ $ptype->id }}">{{ $ptype->type_name }}</option>
                                                @endforeach

                                            </select>
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-4">
                                        <div class="mb-3">
                                            <label class="form-label">Property Amenities</label>
                                            <select name="amenities_id[]" class="js-example-basic-multiple form-select"
                                                multiple="multiple" data-width="100%">
                                                @foreach ($amenities as $amenity)
                                                <option value="{{ $amenity->id }}">{{ $amenity->amenities_name }}</option>
                                                @endforeach

                                            </select>
                                        </div>
                                    </div><!-- Col -->
                                    <div class="col-sm-4">
                                        <div class="mb-3">
                                            <label class="form-label">Agent</label>
                                            <select name="agent_id" class="form-select" id="exampleFormControlSelect1">
                                                <option selected="" disabled="">Select Agent</option>

                                                @foreach ($activeAgent as $agent)
                                                    <option value="{{ $agent->id }}">{{ $agent->name }}</option>
                                                @endforeach

                                            </select>
                                        </div>
                                    </div><!-- Col -->
                                </div><!-- Row -->


                            </form>
                            <button type="button" class="btn btn-primary submit">Submit form</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- middle wrapper end -->
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#myForm').validate({
                rules: {
                    amenities_name: {
                        required: true,
                    },

                },
                messages: {
                    amenities_name: {
                        required: 'Please Enter Amenities Name',
                    },


                },
                errorElement: 'span',
                errorPlacement: function(error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.form-group').append(error);
                },
                highlight: function(element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                },
            });
        });
    </script>

    <script type="text/javascript">
        function mainThumbUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#mainThumb').attr('src', e.target.result).width(80).height(80);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

    <script>
        $(document).ready(function() {
            $('#multiImg').on('change', function() { //on file input change
                if (window.File && window.FileReader && window.FileList && window
                    .Blob) //check File API supported browser
                {
                    var data = $(this)[0].files; //this file data

                    $.each(data, function(index, file) { //loop though each file
                        if (/(\.|\/)(gif|jpe?g|png|webp)$/i.test(file
                            .type)) { //check supported file type
                            var fRead = new FileReader(); //new filereader
                            fRead.onload = (function(file) { //trigger function on successful read
                                return function(e) {
                                    var img = $('<img/>').addClass('thumb').attr('src',
                                        e.target.result).width(100).height(
                                    80); //create image element
                                    $('#preview_img').append(
                                    img); //append image to output element
                                };
                            })(file);
                            fRead.readAsDataURL(file); //URL representing the file's data.
                        }
                    });

                } else {
                    alert("Your browser doesn't support File API!"); //if File API is absent
                }
            });
        });
    </script>
@endsection

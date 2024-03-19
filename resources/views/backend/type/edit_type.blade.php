@extends('admin.admin_dashboard')
@section('content')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <div class="page-content">

        <div class="row profile-body">
            <!-- middle wrapper start -->
            <div class="col-md-8 col-xl-8 middle-wrapper">
                <div class="row">
                    <div class="card">
                        <div class="card-body">

                            <h6 class="card-title">Edit Property Type</h6>

                            <form class="forms-sample" method="POST" action="{{ route('update.type') }}">
                                @csrf

                                <input type="hidden" name="id" value="{{ $types->id }}">

                                <div class="mb-3">
                                    <label for="name" class="form-label">Type Name</label>
                                    <input type="text" name="type_name"
                                        class="form-control @error('type_name') is-invalid @enderror" id="type_name" value="{{ $types->type_name }}">
                                    @error('type_name')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Type Icon</label>
                                    <input type="text" name="type_icon"
                                        class="form-control @error('type_icon') is-invalid @enderror" id="type_icon" value="{{ $types->type_icon }}">
                                    @error('type_icon')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>


                                <button type="submit" class="btn btn-primary me-2">Update Changes</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- middle wrapper end -->
        </div>
    </div>
@endsection

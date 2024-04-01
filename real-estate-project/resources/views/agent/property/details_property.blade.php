@extends('agent.agent_dashboard')
@section('agent')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    <div class="page-content">
        <div class="row">
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h6 class="card-title">Property Details</h6>
                        <p class="text-muted mb-3">Add class <code>.table</code></p>
                        <div class="table-responsive">
                            <table class="table table-striped">

                                <tbody>
                                    <tr>
                                        <td>Property Name</td>
                                        <td><code>{{ $property->property_name }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Property Status</td>
                                        <td><code>{{ $property->property_status }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Lowest Price</td>
                                        <td><code>{{ $property->lowest_price }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Max Price</td>
                                        <td><code>{{ $property->max_price }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Bedrooms</td>
                                        <td><code>{{ $property->bathrooms }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Bathrooms</td>
                                        <td><code>{{ $property->bathrooms }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Garage</td>
                                        <td><code>{{ $property->garage }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Garage Size</td>
                                        <td><code>{{ $property->garage_size }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td><code>{{ $property->address }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>City</td>
                                        <td><code>{{ $property->city }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td><code>{{ $property->state }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Postal Code</td>
                                        <td><code>{{ $property->postal_code }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Main Image</td>
                                        <td>
                                            <img src="{{ asset($property->property_thumbnail) }}"
                                                style="width: 70px; height:70px;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Status</td>
                                        <td>
                                            @if ($property->status == 1)
                                                <span class="badge rounded-pill bg-success">Active</span>
                                            @else
                                                <span class="badge rounded-pill bg-danger">Inactive</span>
                                            @endif
                                        </td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">

                                <tbody>
                                    <tr>
                                        <td>Property Code</td>
                                        <td><code>{{ $property->property_code }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Property Size</td>
                                        <td><code>{{ $property->property_size }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Property Video</td>
                                        <td><code>{{ $property->property_video }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Neighborhood</td>
                                        <td><code>{{ $property->neighborhood }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Latitude</td>
                                        <td><code>{{ $property->latitude }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Longitude</td>
                                        <td><code>{{ $property->longitude }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Property Type</td>
                                        <td><code>{{ $property['type']['type_name'] }}</code></td>
                                    </tr>
                                    <tr>
                                        <td>Property Amenities</td>
                                        <td>
                                            <select name="amenities_id[]" class="js-example-basic-multiple form-select"
                                                multiple="multiple" data-width="100%">
                                                @foreach ($amenities as $amenity)
                                                    <option value="{{ $amenity->id }}"
                                                        {{ in_array($amenity->id, $property_ame) ? 'selected' : '' }}>
                                                        {{ $amenity->amenities_name }}
                                                    </option>
                                                @endforeach

                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Agent</td>

                                        @if ($property->agent_id == null)
                                            <td><code>Admin</code></td>
                                        @else
                                            <td><code>{{ $property['user']['name'] }}</code></td>
                                        @endif

                                    </tr>
                                    {{-- <tr>
                                    <td>Short Description</td>
                                    <td><code>{{ $property->short_description }}</code></td>
                                </tr> --}}
                                    {{-- <tr>
                                    <td>Long Description</td>
                                    <td><code>{!! $property->long_description !!}</code></td>
                                </tr> --}}

                                </tbody>
                            </table>
                            <br><br>
                            @if ($property->status == 1)
                                <form method="POST" action="{{ route('agent.inactive.property') }}">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $property->id }}">
                                    <button type="submit" class="btn btn-primary submit">Inactive</button>
                                </form>
                                @else
                                <form method="POST" action="{{ route('agent.active.property') }}">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $property->id }}">

                                    <button type="submit" class="btn btn-primary submit">Active</button>
                                </form>
                            @endif


                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

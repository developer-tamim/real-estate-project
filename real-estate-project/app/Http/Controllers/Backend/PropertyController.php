<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Amenities;
use App\Models\Facility;
use App\Models\MultiImage;
use App\Models\PackagePlan;
use App\Models\Property;
use App\Models\PropertyMessage;
use App\Models\PropertyType;
use App\Models\State;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use PHPUnit\Framework\Constraint\Count;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Auth;

class PropertyController extends Controller
{
    public function AllProperty()
    {
        $property = Property::latest()->get();
        return view('backend.property.all_property', compact('property'));
    }
    public function AddProperty()
    {

        $propertyType = PropertyType::latest()->get();
        $pstate = State::latest()->get();
        $amenities = Amenities::latest()->get();
        $activeAgent = User::where('status', 'active')->where('role', 'agent')->latest()->get();

        return view('backend.property.add_property', compact('propertyType', 'amenities', 'activeAgent', 'pstate'));
    }
    public function StoreProperty(Request $request)
    {

        $amen = $request->amenities_id;
        $amenities = implode(",", $amen);
        // dd($amenities);

        $pcode = IdGenerator::generate(['table' => 'properties', 'field' => 'property_code', 'length' => 5, 'prefix' => 'PC']);

        $image = $request->file('property_thumbnail');
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        Image::make($image)->resize(370, 250)->save('upload/property/thumbnail/' . $name_gen);
        $save_url = 'upload/property/thumbnail/' . $name_gen;

        $property_id = Property::insertGetId([
            'ptype_id' => $request->ptype_id,
            'amenities_id' => $amenities,
            'property_name' => $request->property_name,
            'property_slug' => strtolower(str_replace(' ', '-', $request->property_name)),
            'property_code' => $pcode,
            'property_status' => $request->property_status,

            'lowest_price' => $request->lowest_price,
            'max_price' => $request->max_price,
            'short_description' => $request->short_description,
            'long_description' => $request->long_description,
            'bedrooms' => $request->bedrooms,
            'bathrooms' => $request->bathrooms,
            'garage' => $request->garage,
            'garage_size' => $request->garage_size,

            'property_size' => $request->property_size,
            'property_video' => $request->property_video,
            'address' => $request->address,
            'city' => $request->city,
            'state' => $request->state,
            'postal_code' => $request->postal_code,

            'neighborhood' => $request->neighborhood,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'featured' => $request->featured,
            'hot' => $request->hot,
            'agent_id' => $request->agent_id,
            'status' => 1,
            'property_thumbnail' => $save_url,
            'created_at' => Carbon::now(),
        ]);

        $images = $request->file('multi_img');

        foreach ($images as $img) {
            $make_name = hexdec(uniqid()) . '.' . $img->getClientOriginalExtension();
            Image::make($img)->resize(770, 520)->save('upload/property/multi-image/' . $make_name);
            $uploadPath = 'upload/property/multi-image/' . $make_name;

            MultiImage::insert([
                'property_id' => $property_id,
                'photo_name' => $uploadPath,
                'created_at' => Carbon::now(),
            ]);
        }

        $facilities = Count($request->facility_name);

        if ($facilities != NULL) {
            for ($i = 0; $i < $facilities; $i++) {
                $fcount = new Facility();
                $fcount->property_id = $property_id;
                $fcount->facility_name = $request->facility_name[$i];
                $fcount->distance = $request->distance[$i];
                $fcount->save();
            }
        };

        $notification = array(
            'message' => 'Property Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('all.property')->with($notification);
    }

    public function EditProperty($id)
    {

        $facilities = Facility::where('property_id', $id)->get();
        $property = Property::findOrFail($id);

        $type = $property->amenities_id;
        $property_ame = explode(',', $type);

        $multiImage = MultiImage::where('property_id', $id)->get();
        $pstate = State::latest()->get();

        $propertyType = PropertyType::latest()->get();
        $amenities = Amenities::latest()->get();
        $activeAgent = User::where('status', 'active')->where('role', 'agent')->latest()->get();

        return view('backend.property.edit_property', compact('property', 'propertyType', 'amenities', 'activeAgent', 'property_ame', 'multiImage', 'facilities', 'pstate'));
    }

    public function UpdateProperty(Request $request)
    {

        $amen = $request->amenities_id;
        $amenities = implode(",", $amen);
        $property_id = $request->id;

        Property::findOrFail($property_id)->update([
            'ptype_id' => $request->ptype_id,
            'amenities_id' => $amenities,
            'property_name' => $request->property_name,
            'property_slug' => strtolower(str_replace(' ', '-', $request->property_name)),
            'property_status' => $request->property_status,

            'lowest_price' => $request->lowest_price,
            'max_price' => $request->max_price,
            'short_description' => $request->short_description,
            'long_description' => $request->long_description,
            'bedrooms' => $request->bedrooms,
            'bathrooms' => $request->bathrooms,
            'garage' => $request->garage,
            'garage_size' => $request->garage_size,

            'property_size' => $request->property_size,
            'property_video' => $request->property_video,
            'address' => $request->address,
            'city' => $request->city,
            'state' => $request->state,
            'postal_code' => $request->postal_code,

            'neighborhood' => $request->neighborhood,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'featured' => $request->featured,
            'hot' => $request->hot,
            'agent_id' => $request->agent_id,
            'updated_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Property Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('all.property')->with($notification);
    }
    public function UpdatePropertyThumbnail(Request $request)
    {
        $property_id = $request->id;
        $oldImage = $request->old_img;

        $image = $request->file('property_thumbnail');
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        Image::make($image)->resize(370, 250)->save('upload/property/thumbnail/' . $name_gen);
        $save_url = 'upload/property/thumbnail/' . $name_gen;

        if (file_exists($oldImage)) {
            unlink($oldImage);
        }

        Property::findOrFail($property_id)->update([
            'property_thumbnail' => $save_url,
            'updated_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Property Image Thumbnail Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }
    // $imgs = $request->file('multi_img');
    public function UpdatePropertyMultiImage(Request $request)
    {
        $imgs = $request->multi_img;

        foreach ($imgs as $id => $img) {
            $imgDel = MultiImage::findOrFail($id);
            unlink($imgDel->photo_name);

            $make_name = hexdec(uniqid()) . '.' . $img->getClientOriginalExtension();
            Image::make($img)->resize(770, 520)->save('upload/property/multi-image/' . $make_name);
            $uploadPath = 'upload/property/multi-image/' . $make_name;

            MultiImage::where('id', $id)->update([
                'photo_name' => $uploadPath,
                'updated_at' => Carbon::now(),
            ]);

            $notification = array(
                'message' => 'Property Multi Image Updated Successfully',
                'alert-type' => 'success'
            );
            return redirect()->back()->with($notification);
        }
    }

    public function PropertyMultiImageDelete($id)
    {
        $oldImg = MultiImage::findOrFail($id);
        unlink($oldImg->photo_name);

        MultiImage::findOrFail($id)->delete();

        $notification = array(
            'message' => 'Property Multi Image Deleted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }
    public function StoreNewMultiImage(Request $request)
    {

        $new_multi = $request->imageid;
        $image = $request->file('multi_img');

        $make_name = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        Image::make($image)->resize(770, 520)->save('upload/property/multi-image/' . $make_name);
        $uploadPath = 'upload/property/multi-image/' . $make_name;

        MultiImage::insert([
            'property_id' => $new_multi,
            'photo_name' => $uploadPath,
            'created_at' => Carbon::now(),
        ]);


        $notification = array(
            'message' => 'Property Multi Image Added Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }
    public function UpdatePropertyFacilities(Request $request)
    {

        $pid = $request->id;
        if ($request->facility_name == NULL) {
            return redirect()->back();
        } else {
            Facility::where('property_id', $pid)->delete();

            $facilities = Count($request->facility_name);

            for ($i = 0; $i < $facilities; $i++) {
                $fcount = new Facility();
                $fcount->property_id = $pid;
                $fcount->facility_name = $request->facility_name[$i];
                $fcount->distance = $request->distance[$i];
                $fcount->save();
            }
        }


        $notification = array(
            'message' => 'Property Facility Updated Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function DeleteProperty($id)
    {
        $property = Property::findOrFail($id);
        unlink($property->property_thumbnail);

        Property::findOrFail($id)->delete();

        $image = MultiImage::where('property_id', $id)->get();

        foreach ($image as $img) {
            unlink($img->photo_name);
            MultiImage::where('property_id', $id)->delete();
        }

        $facilitiesData = Facility::where('property_id', $id)->get();
        foreach ($facilitiesData as $item) {
            $item->facility_name;
            Facility::where('property_id', $id)->delete();
        }

        $notification = array(
            'message' => 'Property Deleted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);

    }

    public function DetailsProperty($id)
    {

        $facilities = Facility::where('property_id', $id)->get();
        $property = Property::findOrFail($id);

        $type = $property->amenities_id;
        $property_ame = explode(',', $type);

        $multiImage = MultiImage::where('property_id', $id)->get();

        $propertyType = PropertyType::latest()->get();
        $amenities = Amenities::latest()->get();
        $activeAgent = User::where('status', 'active')->where('role', 'agent')->latest()->get();

        return view('backend.property.details_property', compact('property', 'propertyType', 'amenities', 'activeAgent', 'property_ame', 'multiImage', 'facilities'));
    }

    public function InactiveProperty(Request $request){
        $pid = $request->id;
        Property::findOrFail($pid)->update([
           'status' => 0,
            'updated_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Property Inactive Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('all.property')->with($notification);
    }
    public function ActiveProperty(Request $request){
        $pid = $request->id;
        Property::findOrFail($pid)->update([
           'status' => 1,
            'updated_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Property Active Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('all.property')->with($notification);
    }

    public function AdminPackageHistory(){
        $packagehistory = PackagePlan::latest()->get();

        return view('backend.package.package_history', compact('packagehistory'));
    }

    public function PackageInvoice($id){
        $packagehistory = PackagePlan::where('id',$id)->first();

        $pdf = Pdf::loadView('backend.package.package_history_invoice', compact('packagehistory'))->setPaper('a4', 'landscape')->setOption([
            'tempDir' => public_path(),
            'chroot' => public_path(),
        ]);
    return $pdf->download('invoice.pdf');
    }

    public function AdminPropertyMessage()
    {

       $usermsg = PropertyMessage::latest()->get();

       return view('backend.message.all_message', compact('usermsg'));

    }

    public function AdminMessageDetails($id)
    {

       $usermsg = PropertyMessage::latest()->get();

       $msgdetails = PropertyMessage::findOrFail($id);

       return view('backend.message.message_details', compact('usermsg', 'msgdetails'));
    }


}

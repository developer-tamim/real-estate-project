<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Facility;
use App\Models\MultiImage;
use App\Models\Property;
use App\Models\PropertyMessage;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
    public function PropertyDetails($id, $slug)
    {
        $property = Property::findOrFail($id);
        $amenities = $property->amenities_id;
        $property_amen = explode(',', $amenities);
        $muliImage = MultiImage::where('property_id', $id)->get();
        $facility = Facility::where('property_id', $id)->get();

        $type_id = $property->ptype_id;
        $relatedProperty = Property::where('ptype_id', $type_id)->where('id', '!=', $id)->orderBy('id', 'DESC')->limit(3)->get();

        return view('frontend.property.property_details', compact('property', 'property_amen', 'muliImage', 'facility', 'relatedProperty'));
    }

    public function PropertyMessage(Request $request)
    {
        $pid = $request->property_id;
        $aid = $request->agent_id;

        if(Auth::check()){

            PropertyMessage::insert([
                'user_id' => Auth::user()->id,
                'agent_id' => $aid,
                'property_id' => $pid,
                'msg_name' => $request->msg_name,
                'msg_email' => $request->msg_email,
                'msg_phone' => $request->msg_phone,
                'message' => $request->message,
                'created_at' => Carbon::now(),
            ]);

            $notification = array(
                'message' => 'Send Message Successfully',
                'alert-type' =>'success'
            );

            return redirect()->back()->with($notification);

        }else{

            $notification = array(
                'message' => 'Please Login To You Account First',
                'alert-type' =>'error'
            );

            return redirect()->back()->with($notification);
        }
    }

    public function AgentDetails($id){
        $agent = User::findOrFail($id);

        return view('frontend.agent.agent_details', compact('agent'));
    }
}

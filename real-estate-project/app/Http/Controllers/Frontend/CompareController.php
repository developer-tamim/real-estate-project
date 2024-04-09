<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Compare;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CompareController extends Controller
{
    public function AddToCompare(Request $request, $property_id)
    {
        if (Auth::check()) {
            $exists = Compare::where('user_id', Auth::id())->where('property_id', $property_id)->exists();
            if (!$exists) {
                Compare::insert([
                    'user_id' => Auth::id(),
                    'property_id' => $property_id,
                    'created_at' => Carbon::now(),
                ]);
                return response()->json(['success' => 'Successfully Added On Your Compare List']);
            } else {
                return response()->json(['error' => 'This Property Has Already In Your Compare List']);
            }
        } else {
            return response()->json(['error' => 'At First Login To Your Account']);
        }
    }

    public function UserCompare()
    {

        return view('frontend.dashboard.compare');
    }



    public function GetCompareProperty()
    {
        $compare = Compare::with('property')->where('user_id', Auth::id())->latest()->get();

        return response()->json($compare);
    }



    public function CompareRemove($id)
    {
        Compare::where('user_id', Auth::id())->where('id', $id)->delete();

        return response()->json(['success' => 'Compare Property Remove Successfully']);
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AgentController extends Controller
{
    public function AgentDashboard()
    {
        return view('agent.agent_dashboard');
    }

    public function AgentLogin()
    {
        return view('agent.agent_login');
    }
    public function AgentRegister(Request $request)
    {
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
            'role' => 'agent',
            'status' => 'inactive',
        ]);

        event(new Registered($user));
        // dd($request);

        Auth::login($user);

        return redirect(RouteServiceProvider::AGENT);
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        return view('home');
    }

    public function provinces() {

        $token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImI5MWJmMjlhMWRlNzg5MzRkNGE1MmFkNzQ2YjA1NzRjNjUxZjk0YWVkZWI1NGE0Zjc2ZmEzNDk4YTQzN2NiZDY3ODM2NzVjOTQ1MDgyYjljIn0.eyJhdWQiOiIzIiwianRpIjoiYjkxYmYyOWExZGU3ODkzNGQ0YTUyYWQ3NDZiMDU3NGM2NTFmOTRhZWRlYjU0YTRmNzZmYTM0OThhNDM3Y2JkNjc4MzY3NWM5NDUwODJiOWMiLCJpYXQiOjE1NTc5NzM0MTAsIm5iZiI6MTU1Nzk3MzQxMCwiZXhwIjoxNTg5NTk1ODEwLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.0MmXQ4Ic4j32D4FaTva4zyIJvTiIBn3VNpIO6hS_oMBhgpWMQ1ORKXUEG0MASXwsdh_xO_aocdX6Ev1NUiImRzqUOBDVEnX8hri66gOE0LgVjEsDh6RpdGgWDQQfyuTv0FZbipOHZYxz02HeiZgcyjbpC5PP7yoRewMWZYMtxJmLf9GqqH_1emzeRsgvTeFPyAUJuq49ieJ7GjLHHDBXhcIDb7JFk3T6NiZWu4pZZgshSm3P8JrLNlfKmxn1RAaNvGWmrOzgsD91vpLMWqt2pFR7_nHPntHfwdvjYTrzf9ZR8L0t7FhPI6giUXJo-AZTwDVm3Z38TFm1e5AR0uLDJ2b9iNUlw_OAcLJY2hh6ysPP7W_r63g2L-LdjWU_46L_yqwsvTk9HHTaDUhWXIp8IzHfrZIXvoG1K4eJyZKPxxFcycEKttliP7kMBt53K77-sUx6rQ1RYKSYNi-X3CFMs2uEY85vuFvo-6ZqajjkKM0uYMNlJYGlupDswjRZiFGiJsZDKzqLCQVBJb35lafyX1iyzL1Kdlq6l6zmaVCuRIAQ8hb9PdKxWs-zVtHFzg8T0Fux_jb_VAuww3-bHYDhlEERYpPvwOOQjhASCsxON5GBoIob7i8k3bXF-zhSXc0K4U1OdpC228NuKcUmdTh1PFDusNIIB6knC1fbcc8Z-pA';
        $client = new Client();
        // $headers = [
        //     'Authorization' => 'Bearer ' . $token,
        //     'Accept'        => 'application/json',
        //     'cache-control' => 'no-cache'
        // ];

        // $request = $client->request('GET', 'provinces', [
        //     'headers' => $headers
        // ]);
        // $provinces = $request->getBody()->getContents();
        // dd($provinces);

        $provinceReq = $client->get('http://larapassport.local/api/provinces/', [
           'headers' => [
               'Authorization' => 'Bearer ' . $token,
           ]
       ]);
       $response = $provinceReq->getBody()->getContents();
       dd($response);
        return view('province')->compact('provinces');
    }
}

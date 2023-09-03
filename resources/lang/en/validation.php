<?php
return[
'custom' => [
    'email' => [
        'required' => 'E-mail address is required!',
        'unique'=>'Email is already in use',
        'email'=>'Please inser valid email address',  
        'exists'=>'Email address does not exist in our systems',
        "confirmed"=>'The emails dont match'

      ],
      'password' => [
        'min' => 'The password  must be at least 8 characters',
        'uppercase' => 'The password field must contain at least one uppercase and one lowercase letter',
        'symbol' => 'The password field must contain at least one symbol character',
        'numeric' => 'The password field must contain at least one number',
        'required'=>'Insert an password please',
        "confirmed"=>'The passwords dont match'
      ],
    'id' => [
        'required' => 'Id address is required!',
        ],
    "phone"=>[
        'unique'=>'Phone number is already in use!'
    ]
],
]



?>